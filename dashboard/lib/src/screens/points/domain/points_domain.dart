import 'dart:convert';

import 'package:dashboard/src/core/navigation/routes.dart';
import 'package:dashboard/src/screens/points/data/point.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/navigation/api.dart';
import '../../../core/navigation/auth.dart';

part 'points_domain.g.dart';

@riverpod
Future<List<Point>> getPoints(
  Ref ref,
) async {
  final response = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "points", method: "GET");
  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body);

    return decoded.map<Point>((e) => Point.fromJson(e)).toList();
  }

  return [];
}

@riverpod
Future<String?> addPoints(Ref ref,
    {required String nameEn,
    required String nameAr,
    required String detailsEn,
    required String detailsAr,
    required int points,
    required int days,
    required int offers}) async {
  final response = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "points", method: "POST", body: {
    "name": {"en": nameEn, "ar": nameAr},
    "details": {"en": detailsEn, "ar": detailsAr},
    "percentage": offers,
    "required_points": points,
    "available_days": days,
    "active": true
  });

  if (response.statusCode == 201) {
    ref.invalidate(getPointsProvider);
    ref.read(goRouterProvider).pop();
    return "Successful";
  }

  return Future.error(ref.read(httpProvider).getResponseError(response));
}

@riverpod
Future<String?> updatePoint(Ref ref,
    {required String nameEn,
    required String nameAr,
    required String id,
    required String detailsEn,
    required String detailsAr,
    required int points,
    required int days,
    required int offers}) async {
  final response = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "points/$id", method: "PATCH", body: {
    "name": {"en": nameEn, "ar": nameAr},
    "details": {"en": detailsEn, "ar": detailsAr},
    "percentage": offers,
    "required_points": points,
    "available_days": days,
    "active": true
  });
  if (response.statusCode == 200) {
    ref.invalidate(getPointsProvider);

    ref.read(goRouterProvider).pop();
    return "Successful";
  }

  return Future.error(ref.read(httpProvider).getResponseError(response));
}
