import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/navigation/api.dart';
import '../../../core/navigation/auth.dart';
import '../../auth/data/auth_data.dart';

part 'points_domain.g.dart';

@riverpod
Future<List<User>> getPoints(Ref ref,
    {required int page, String? query}) async {

  final response = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "points", method: "GET");
  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body)["customers"];

    return decoded.map<User>((e) => User.fromJson(e)).toList();
  }
  if (response.statusCode == 401) {
    ref.read(authProvider).refreshAccessToken();
    return [];
  }
  return [];
}
