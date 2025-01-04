import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refix/src/screens/points/data/points.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api.dart';
import '../../auth/domain/auth_domain.dart';

part 'points_domain.g.dart';

@riverpod
Future<List<Point>> getUserPoints(Ref ref) async {
  final response = await ref
      .read(httpProvider)
      .authenticatedRequest(method: "GET", url: "points/available");
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data.map<Point>((e) => Point.fromJson(e)).toList();
  }
  if (response.statusCode == 401) {
    ref.read(authProvider).refreshAccessToken();
  }
  return [];
}

@riverpod
Future<void> claimPoints(Ref ref, {required String pointsID}) async {
  final response = await ref
      .read(httpProvider)
      .authenticatedRequest(method: "PATCH", url: "points/claim/$pointsID");
  if (response.statusCode == 201) {
    return jsonDecode(response.body);
  }
  if (response.statusCode == 401) {
    ref.read(authProvider).refreshAccessToken();
  }
  return ;
}
