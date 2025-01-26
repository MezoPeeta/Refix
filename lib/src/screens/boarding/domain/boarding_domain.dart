import 'dart:convert';
import 'dart:developer';

import 'package:refix/src/core/network/api.dart';
import 'package:refix/src/screens/boarding/data/boarding_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'boarding_domain.g.dart';

@riverpod
Future<List<Boarding>> getBoarding(Ref ref) async {
  final response = await ref.read(httpProvider).get(apiName: "onboarding");

  var decodedResponse = jsonDecode(response.body);
  log("De: $decodedResponse");
  // Check if the decoded response is a List
  if (decodedResponse is List) {
    return decodedResponse
        .map<Boarding>((item) => Boarding.fromJson(item))
        .toList();
  }
  return [];
}
