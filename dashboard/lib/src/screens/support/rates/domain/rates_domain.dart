import 'dart:convert';

import 'package:dashboard/src/screens/booking/data/booking.dart';
import 'package:dashboard/src/screens/support/rates/data/rates_data.dart';
import 'package:dashboard/src/screens/users/domain/source.dart';
import 'package:flutter/material.dart';
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

@riverpod
Future<List<BookingElement>> getReports(Ref ref,
    {required int page, String? query}) async {
  final url = query != null
      ? "booking/problem-not-resolved?page=$page&take=10&search=$query"
      : "booking/problem-not-resolved?page=$page&take=10";
  final response = await ref
      .read(httpProvider)
      .authenticatedRequest(url: url, method: "GET");
  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body);
    return decoded   
        .map<BookingElement>((e) => BookingElement.fromJson(e))
        .toList();
  }

  return [];
}

@riverpod
Future<String> resolveBooking(Ref ref, {required String bookingID}) async {
  final response = await ref.read(httpProvider).authenticatedRequest(
      url: "booking/$bookingID/problem-not-resolved/resolve", method: "PATCH");
  return getReMessage(response.body);
}

String getReMessage(dynamic message) {
  if (message is String) {
    return message;
  }

  if (jsonDecode(message) is Map<String, dynamic>) {
    final mess = message["message"];
    if (mess is List) {
      return mess.first;
    }
    return mess;
  }

  return message;
}
