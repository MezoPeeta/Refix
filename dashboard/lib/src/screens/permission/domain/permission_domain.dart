import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/navigation/api.dart';
import '../../auth/data/auth_data.dart';

part 'permission_domain.g.dart';

@riverpod
Future<String> createPermissionUser(Ref ref,
    {required String username,
    required String email,
    required String password,
    required String phone,
    required String roleID}) async {
  final request = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "user", method: "POST", body: {
    "username": username,
    "email": email,
    "password": password,
    "phone": phone,
    "role": roleID
  });
  final data = jsonDecode(request.body);
  if (request.statusCode == 200) {
    return data;
  }
  return data["message"] is List ? data["message"].first : data["message"];
}

@riverpod
Future<String> updatePermissionUser(Ref ref,
    {required String username,
    required String email,
    required String id,
    required String phone,
    required String roleID}) async {
  final request = await ref.read(httpProvider).authenticatedRequest(
      url: "user/$id",
      method: "PATCH",
      body: {
        "username": username,
        "email": email,
        "role": roleID,
        "phone": phone
      });
  final data = jsonDecode(request.body);
  if (request.statusCode == 200) {
    return data;
  }
  return data["message"] is List ? data["message"].first : data["message"];
}
