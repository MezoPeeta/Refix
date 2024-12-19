import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api.dart';
import '../../auth/domain/auth_domain.dart';

part 'booking_domain.g.dart';

@riverpod
Future<Either<String, String>> addBooking(Ref ref,{required List<String> services,required DateTime date}) async {
  final response = await ref
      .read(httpProvider)
      .authenticatedRequest(method: "POST", url: "booking", body: {
    "services": services,
    "appointment_date": date,
    "notes": "string",
    "images_before_reaper": ["string"],
    "status": "PENDING"
  });
  if (response.statusCode == 200) {
    return right("Successful");
  }
  if (response.statusCode == 401) {
    ref.read(authProvider).logout();
  }
  return left("Failed");
}
