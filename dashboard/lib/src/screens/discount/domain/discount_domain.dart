import 'dart:convert';

import 'package:dashboard/src/core/navigation/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/discount_data.dart';

part 'discount_domain.g.dart';

@riverpod
Future<List<Discount>> getDiscounts(Ref ref) async {
  final request = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "discount", method: "GET");
  final body = jsonDecode(request.body);
  if (request.statusCode == 200) {
    return body.map<Discount>((e) => Discount.fromJson(e)).toList();
  }
  return [];
}

@riverpod
Future<String?> updateDiscount(Ref ref, {required Discount discount}) async {
  final request = await ref.read(httpProvider).authenticatedRequest(
      url: "discount/${discount.id}", method: "PATCH", body: discount.toJson());
  if (request.statusCode == 200) {
    ref.invalidate(getDiscountsProvider);
    return "Discount updated";
  }
  return null;
}
