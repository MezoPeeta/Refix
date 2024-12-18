import 'dart:convert';
import 'dart:io';

import 'package:dashboard/src/core/navigation/api.dart';
import 'package:dashboard/src/core/navigation/auth.dart';
import 'package:dashboard/src/screens/content/data/boarding_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' as mime;

part 'onetime_domain.g.dart';

@riverpod
Future<Either<String, String>> updateBoarding(Ref ref,
    {required String id,
    required String headingEn,
    required String headingAr,
    required String detailsEn,
    required String detailsAr,
    required Uint8List image}) async {
  final baseAPI = ref.read(httpProvider).baseAPI;
  final token = await ref.read(authProvider).getAccessToken();
  var request =
      http.MultipartRequest('PUT', Uri.parse('${baseAPI}onboarding/$id'));
  request.fields['heading'] = jsonEncode({"en": headingEn, "ar": headingAr});
  request.fields['details'] = jsonEncode({"en": detailsEn, "ar": detailsAr});

  request.files.add(http.MultipartFile.fromBytes("image", image,
      filename: "image.jpeg", contentType: mime.MediaType('image', 'jpeg')));

  request.headers['Authorization'] = 'Bearer $token';
  debugPrint(request.fields.toString());
  try {
    var response = await request.send();
    final d = await response.stream.bytesToString();
    print("Response: $response");
    if (response.statusCode == 200) {
      print('Upload successful');
      return right("Upload successful");
    } else {
      return left("Upload Failed, try refreshing");
    }
  } catch (e) {
    print('Error uploading image: $e');
  }
  return left("Upload Error");
}

@riverpod
Future<List<Boarding>> getBoarding(Ref ref) async {
  final response = await ref.read(httpProvider).get(apiName: "onboarding");
  var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List;
  return decodedResponse.map((item) => Boarding.fromJson(item)).toList();
}
