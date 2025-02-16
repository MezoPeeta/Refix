import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:worker/src/core/cache/helper.dart';

import '../../../core/network/api.dart';

part 'tasks_domain.g.dart';

// final taskRequestedProvider = StateProvider.family<bool, String>((ref, taskId) => false);

@riverpod
class TaskRequested extends _$TaskRequested {
  @override
  bool build({required String taskID}) {
    return CacheHelper.getBool(taskID) ?? false;
  }

  void change({required bool value}){
    state = value;
    CacheHelper.setBool(super.taskID, value);
  }
}





@riverpod
Future<String> updateBooking(Ref ref,
    {required String id,
    String? description,
    required String status,
    List<XFile>? images}) async {
  try {
    final response = await ref
        .read(httpProvider)
        .authenticatedRequest(method: "PATCH", url: "booking/$id", body: {
      "status": status,
      if (images != null) "images_after_reaper": convertImages(images),
      if (description != null) "description_problem": description
    });
    log("Response: ${response.body}");
    ref.read(taskRequestedProvider(taskID: id).notifier).change(value: true);
    return "Booking status updated";
  } catch (e) {
    log("Error:", error: e);
  }

  return "Error occured";
}

Future<List<String>> convertImages(List<XFile> images) async {
  List<String> imagesBytes = [];

  for (var image in images) {
    // Compress the image
    String compressedPath = await compressImage(image);
    final bytes = await File(compressedPath).readAsBytes();

    // Convert to base64
    imagesBytes.add(base64Encode(bytes));
  }

  return imagesBytes;
}

Future<String> compressImage(XFile image) async {
  final Directory tempDir = await getTemporaryDirectory();

  // Read the original image bytes
  final Uint8List bytes = await image.readAsBytes();

  // Compress the image
  final Uint8List compressedBytes = await FlutterImageCompress.compressWithList(
    bytes,
    minHeight: 1080,
    minWidth: 1080,
    quality: 70,
    format: CompressFormat.webp,
  );

  final String fileName =
      'compressed_${DateTime.now().millisecondsSinceEpoch}_${image.name}';
  final File compressedFile = File('${tempDir.path}/$fileName');
  await compressedFile.writeAsBytes(compressedBytes);
  return compressedFile.path;
}