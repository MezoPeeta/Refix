import 'dart:convert';

import 'package:dashboard/src/core/navigation/api.dart';
import 'package:dashboard/src/core/navigation/auth.dart';
import 'package:dashboard/src/screens/content/data/boarding_data.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:image/image.dart' as img;

part 'onetime_domain.g.dart';

@riverpod
Future<Either<String, String>> updateBoarding(Ref ref,
    {required String id,
    required String headingEn,
    required String headingAr,
    required String detailsEn,
    required String detailsAr,
    required Uint8List image}) async {
  final request = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "onboarding/$id", method: "PUT", body: {
    "heading": jsonEncode({"en": headingEn, "ar": headingAr}),
    "details": jsonEncode({"en": detailsEn, "ar": detailsAr}),
    "image": base64Encode(await compressImage(image))
  });
  if (request.statusCode == 200) {
    return right("Upload successful");
  } else if (request.statusCode == 401) {
    ref.read(authProvider).logout();
  } else {
    print(request.body);
    final errorMessage = jsonDecode(request.body)["message"];
    if (errorMessage is List) {
      return left(errorMessage.first);
    }
    return left(errorMessage);
  }

  return left("Upload Error");
}

@riverpod
Future<List<Boarding>> getBoarding(Ref ref) async {
  final response = await ref.read(httpProvider).get(apiName: "onboarding");
  var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List;
  return decodedResponse.map((item) => Boarding.fromJson(item)).toList();
}

// Add this helper function
Future<Uint8List> compressImage(Uint8List imageBytes) async {
  final img.Image? image = img.decodeImage(imageBytes);
  if (image == null) return imageBytes;

  // Compress while maintaining reasonable quality
  final img.Image compressedImage = img.copyResize(
    image,
    width: 1024, // or your desired max width
    height: (1024 * image.height ~/ image.width), // maintain aspect ratio
  );

  return Uint8List.fromList(img.encodeJpg(compressedImage, quality: 85));
}
