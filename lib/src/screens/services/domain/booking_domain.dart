import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:refix/src/screens/services/data/bookin_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api.dart';
import '../../auth/data/auth_data.dart';
import '../../auth/domain/auth_domain.dart';

part 'booking_domain.g.dart';

List<String> convertPhotosToBase64(List<String> images) {
  List<String> base64photos = [];
  for (var image in images) {
    final bytesImage = File(image).readAsBytesSync();
    final base64Image = base64Encode(bytesImage);
    base64photos.add(base64Image);
  }
  return base64photos;
}

@riverpod
Future<String> addBooking(Ref ref,
    {required List<String> services,
    required DateTime date,
    required List<String> images}) async {
  final response = await ref
      .read(httpProvider)
      .authenticatedRequest(method: "POST", url: "booking", body: {
    "services": services,
    "appointment_date": date.toIso8601String(),
    "notes": "ssds",
    "images_before_reaper": convertPhotosToBase64(images),
    "status": "PENDING"
  });

  log("Booking Request: ${response.body}");
  if (response.statusCode == 201) {
    return response.body;
  }
  if (response.statusCode == 401) {
    ref.read(authProvider).logout();
    return Future.error("Failed");
  }
  return Future.error("Failed");
}

@riverpod
Future<void> updateCustomer(Ref ref, {required User customer}) async {
  final request = await ref.read(httpProvider).authenticatedRequest(
      url: "customer/${customer.id}", method: "PATCH", body: customer.toJson());
  log(request.body);
  if (request.statusCode == 200) {
    log("Customer updated");
  }
}

@riverpod
Future<List<Booking>> getUserBooking(Ref ref) async {
  final request = await ref.read(httpProvider).authenticatedRequest(
      url: "customer/book", method: "GET");
  // log(request.body);
  if (request.statusCode == 200) {
    final data = jsonDecode(request.body);
    return data.map<Booking>((e)=>Booking.fromJson(e)).toList();
  }
   if (request.statusCode == 401) {
    ref.read(authProvider).logout();
  }
  return [];
}

