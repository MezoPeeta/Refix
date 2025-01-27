import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:refix/src/core/navigation/routes.dart';
import 'package:refix/src/screens/boarding/data/boarding_data.dart';
import 'package:refix/src/screens/services/data/bookin_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api.dart';
import '../../auth/data/auth_data.dart';
import '../../auth/domain/auth_domain.dart';
import 'package:http/http.dart' as http;

part 'booking_domain.g.dart';

List<String> convertPhotosToBase64(List<String> images) {
  log("Starting Converting photos");
  final stopwatch = Stopwatch()..start();

  List<String> base64photos = [];
  for (var image in images) {
    final bytesImage = File(image).readAsBytesSync();
    final base64Image = base64Encode(bytesImage);
    base64photos.add(base64Image);
  }
  log('No of Photos: ${images.length}');

  log('Convertion Images executed in milliseconds: ${stopwatch.elapsed.inMilliseconds}');

  return base64photos;
}

Future<String> compressImage(XFile image) async {
  final Directory tempDir = await getTemporaryDirectory();

  // Read the original image bytes
  final Uint8List bytes = await image.readAsBytes();

  // Compress the image
  final Uint8List compressedBytes = await FlutterImageCompress.compressWithList(
    bytes,
    minHeight: 1080,
    minWidth: 1080,
    quality: 70,
    format: CompressFormat.webp,
  );

  final String fileName =
      'compressed_${DateTime.now().millisecondsSinceEpoch}_${image.name}';
  final File compressedFile = File('${tempDir.path}/$fileName');
  await compressedFile.writeAsBytes(compressedBytes);
  return compressedFile.path;
}

@riverpod
Future<String> addBooking(Ref ref,
    {required List<String> services,
    required DateTime date,
    required String notes,
    required List<String> imagePaths}) async {
  log("Starting Booking");
  try {
    final request = await ref.read(httpProvider).sendMultipart(
        url: "booking/v2", fieldName: "images", filePaths: imagePaths);

    request.fields.addAll({
      "services": jsonEncode(services),
      "appointment_date": date.toIso8601String(),
      "notes": notes,
    });
    log("Booking Fields: ${request.fields}");

    final response = await request.send();
    final body = await response.stream.bytesToString();
    log("Response Body : $body");
    if (response.statusCode == 201) {
      return jsonDecode(body)["bookingId"];
    }
    return jsonDecode(body)["message"];
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
Future<String> updateBooking(Ref ref,
    {required String status, required String id}) async {
  final request = await ref.read(httpProvider).authenticatedRequest(
      url: "booking/$id", method: "PATCH", body: {"status": status});
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
Future<Discount?> getDiscount(Ref ref, {required String pageName}) async {
  final request = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "discount/page/$pageName", method: "GET");
  if (request.statusCode == 200) {
    return Discount.fromJson(jsonDecode(request.body));
  }
  return null;
}

@riverpod
Future<bool> updateBookingMethod(Ref ref,
    {required String bookingID, required String method}) async {
  final request = await ref.read(httpProvider).authenticatedRequest(
      url: "booking/$bookingID/payment-method",
      method: "PATCH",
      body: {"payment_method": method});
  if (request.statusCode == 200) {
    return true;
  }
  return false;
}

@riverpod
Future<void> paymentBooking(Ref ref, {required String bookingID}) async {
  final request = await ref.read(httpProvider).authenticatedRequest(
        url: "payment/pay/$bookingID",
        method: "POST",
      );

  if (request.statusCode == 201) {
    final paymentURL = jsonDecode(request.body)["result"]["paymentUrl"];
    log("Payment: $paymentURL");

    ref.read(goRouterProvider).push("/payment_web", extra: paymentURL);
  }
}

@riverpod
Future<String> addBookingReview(Ref ref,
    {required double rating,
    required String comment,
    required String bookingID}) async {
  final response = await ref.read(httpProvider).authenticatedRequest(
      method: "POST",
      url: "review",
      body: {"rating": rating, "comment": comment, "booking": bookingID});
  log("Response: ${response.body}");
  if (response.statusCode == 201) {
    ref.invalidate(getUserBookingProvider);
    ref.read(goRouterProvider).pop();
    return jsonDecode(response.body);
  }

  return jsonDecode(response.body);
}
