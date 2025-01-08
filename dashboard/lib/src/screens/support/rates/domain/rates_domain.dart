import 'dart:convert';

import 'package:dashboard/src/screens/support/rates/data/rates_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/navigation/api.dart';

part 'rates_domain.g.dart';

@riverpod
Future<List<Reviews>> getRates(Ref ref,
    {required int page, String? query}) async {
  final url = query != null
      ? "review?page=$page&take=10&search=$query"
      : "review?page=$page&take=10";
  final response = await ref
      .read(httpProvider)
      .authenticatedRequest(url: url, method: "GET");
  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body)["reviews"];

    return decoded.map<Reviews>((e) => Reviews.fromJson(e)).toList();
  }

  return [];
}
