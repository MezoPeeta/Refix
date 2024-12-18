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
  final request = await ref.read(httpProvider).uploadFile(
      api: "onboarding/$id",
      method: "PUT",
      bytesFile: image,
      body: {
        "heading": jsonEncode({"en": headingEn, "ar": headingAr}),
        "details": jsonEncode({"en": detailsEn, "ar": detailsAr}),
      });

  try {
    var response = await request.send();
    final d = await response.stream.bytesToString();
    print("Response: $response");
    if (response.statusCode == 200) {
      print('Upload successful');
      return right("Upload successful");
    } else if (response.statusCode == 401) {
      ref.read(authProvider).logout();
    } else {
      print(d);
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
