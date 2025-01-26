import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refix/src/screens/reviews/data/reviews_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api.dart';

part 'reviews_domain.g.dart';

@riverpod
Future<List<Review>> getReviews(Ref ref, {required String type}) async {
  final response = await ref.read(httpProvider).authenticatedRequest(
      method: "GET", url: "review/service?serviceType=$type");
  final data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    return data.map<Review>((e) => Review.fromJson(e)).toList();
  }

  return [];
}
