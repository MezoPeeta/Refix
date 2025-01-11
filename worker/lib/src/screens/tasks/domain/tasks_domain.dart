import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api.dart';

part 'tasks_domain.g.dart';

@riverpod
Future<String> updateBooking(Ref ref,
    {required String id,
    String? description,
    required String status,
    List<String>? images}) async {
  try {
    final response = await ref
        .read(httpProvider)
        .authenticatedRequest(method: "PATCH", url: "booking/$id", body: {
      "status": status,
      if (images != null) "images_after_reaper": convertImages(images),
      if (description != null) "description_problem": description
    });
    log("Response: ${response.body}");

    return "Booking status updated";
  } catch (e) {
    log("Error:", error: e);
  }

  return "Error occured";
}

List<String> convertImages(List<String> images) {
  List<String> imagesBytes = [];
  for (var image in images) {
    final bytes = File(image).readAsBytesSync();
    imagesBytes.add(base64Encode(bytes));
  }
  return imagesBytes;
}
