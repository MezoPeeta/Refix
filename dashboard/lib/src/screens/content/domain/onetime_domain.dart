import 'dart:convert';
import 'dart:io';

import 'package:dashboard/src/core/navigation/api.dart';
import 'package:dashboard/src/core/navigation/auth.dart';
import 'package:dashboard/src/screens/content/data/boarding_data.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
part 'onetime_domain.g.dart';

@riverpod
Future<void> updateBoarding(Ref ref,
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
  request.fields['heading.en'] = headingEn;
  request.fields['heading.ar'] = headingAr;
  request.fields['details.en'] = detailsEn;
  request.fields['details.ar'] = detailsAr;

  // Add the image file
  request.files
      .add(http.MultipartFile.fromBytes('image', image, filename: 'image.jpg'));

  request.headers['Authorization'] = 'Bearer $token';

  try {
    var response = await request.send();
    var responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      print('Upload successful');
      print(responseBody);
    } else {
      print('Upload failed');
      print(responseBody);
    }
  } catch (e) {
    print('Error uploading image: $e');
  }
}

@riverpod
Future<List<Boarding>> getBoarding(Ref ref) async {
  final response = await ref.read(httpProvider).get(apiName: "onboarding");
  var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List;
  return decodedResponse.map((item) => Boarding.fromJson(item)).toList();
}