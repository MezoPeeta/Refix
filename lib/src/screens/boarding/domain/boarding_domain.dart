import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:refix/src/core/network/api.dart';
import 'package:refix/src/screens/boarding/data/boarding_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'boarding_domain.g.dart';

@riverpod
Future<List<Boarding>> getBoarding(Ref ref) async {
  final response = await ref.read(httpProvider).get(apiName: "onboarding");
  var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List;
  print(decodedResponse);
  return decodedResponse.map((item) => Boarding.fromJson(item)).toList();
}
