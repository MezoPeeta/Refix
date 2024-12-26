import 'dart:convert';

import 'package:dashboard/src/core/navigation/api.dart';
import 'package:dashboard/src/core/navigation/auth.dart';
import 'package:dashboard/src/screens/auth/data/auth_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'roles.g.dart';

@riverpod
Future<Role?> getRoleByID(Ref ref, {required String id}) async {
  final request = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "role/$id", method: "GET");

  if (request.statusCode == 200) {
    return Role.fromJson(jsonDecode(request.body));
  }
  if (request.statusCode == 401) {
    ref.read(authProvider).refreshAccessToken();
    getRoleByID(ref, id: id);
  }

  return null;
}
