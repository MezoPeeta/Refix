import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refix/src/screens/boarding/data/boarding_data.dart';
import 'package:refix/src/screens/services/data/bookin_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api.dart';
import '../../auth/data/auth_data.dart';
import '../../auth/domain/auth_domain.dart';
import 'package:http/http.dart' as http;

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
  try {
    final response = await ref
        .read(httpProvider)
        .authenticatedRequest(method: "POST", url: "booking", body: {
      "services": services,
      "appointment_date": date.toIso8601String(),
      "notes": "ssds",
      "images_before_reaper": convertPhotosToBase64(images),
      "payment_method": "CASH"
    });

    log("Booking Request: ${response.body}");
    if (response.statusCode == 201) {
      return response.body;
    }
    return jsonDecode(response.body)["message"];
  } catch (e) {
    return e.toString();
  }
}

@riverpod
Future<void> updateCustomer(Ref ref, {required User customer}) async {
  final request = await ref.read(httpProvider).authenticatedRequest(
      url: "customer/${customer.id}", method: "PATCH", body: customer.toJson());
  if (request.statusCode == 200) {
    log("Customer updated");
  }
}

@riverpod
Future<List<Booking>> getUserBooking(Ref ref) async {
  final request = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "customer/book", method: "GET");
  if (request.statusCode == 200) {
    final data = jsonDecode(request.body);
    return data.map<Booking>((e) => Booking.fromJson(e)).toList();
  }
  if (request.statusCode == 401) {
    ref.read(authProvider).refreshAccessToken();
  }
  return [];
}

@riverpod
Future<String?> getLocation(Ref ref,
    {required double latitude, required double longitude}) async {
  final request = await http.get(Uri.parse(
      "https://nominatim.openstreetmap.org/reverse?format=json&lat=$latitude&lon=$longitude"));
  final data = jsonDecode(request.body);
  return data["address"]["road"];
}

@riverpod
Future<String> updateBooking(Ref ref, {required Booking booking}) async {
  final request = await ref.read(httpProvider).authenticatedRequest(
      url: "booking/${booking.id}", method: "PATCH", body: booking.toJson());
  return getResponseMessage(jsonDecode(request.body));
}

@riverpod
Future<String> addNoteBooking(Ref ref,
    {required int bookingID, required String note}) async {
  final request = await ref.read(httpProvider).authenticatedRequest(
      url: "booking/$bookingID/note", method: "PATCH", body: {"note": note});
  return getResponseMessage(jsonDecode(request.body));
}

String getResponseMessage(dynamic message) {
  if (message is Map<String, dynamic>) {
    final mess = message["message"];
    if (mess is List) {
      return mess.first;
    }
    return mess;
  }

  return message;
}

@riverpod
Future<Discount?> getDiscount(Ref ref,
    {required String pageName}) async {
  final request = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "discount/page/$pageName", method: "GET");
  log(request.body);
  if (request.statusCode == 200) {
    return Discount.fromJson(jsonDecode(request.body));
  }
  return null;
}
