import 'dart:convert';

import 'package:dashboard/src/core/navigation/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/navigation/api.dart';
import '../../auth/data/auth_data.dart';

part 'rules_domain.g.dart';

@riverpod
Future<List<Permission>> getPermissions(Ref ref) async {
  final request = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "role/permissions", method: "GET");
  final data = jsonDecode(request.body) as List;
  if (request.statusCode == 200) {
    return data.map<Permission>((e) => Permission.fromJson(e)).toList();
  }
  return [];
}

@riverpod
Future<Role?> getRoleByID(Ref ref, {required String id}) async {
  final request = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "role/$id", method: "GET");
  final data = jsonDecode(request.body) as Map<String, dynamic>;
  if (request.statusCode == 200) {
    return Role.fromJson(data);
  }
  return null;
}

@riverpod
class RoleNotifier extends _$RoleNotifier {
  Future<List<Role>> _fetchRoles() async {
    final request = await ref
        .read(httpProvider)
        .authenticatedRequest(url: "role", method: "GET");
    final data = jsonDecode(request.body) as List;
    if (request.statusCode == 200) {
      return data.map<Role>((e) => Role.fromJson(e)).toList();
    }
    return [];
  }

  @override
  FutureOr<List<Role>> build() => _fetchRoles();

  Future<String> deleteRole(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final request = await ref.read(httpProvider).authenticatedRequest(
            url: "role/$id",
            method: "DELETE",
          );
      if (request.statusCode == 200) {
        ref.read(goRouterProvider).pop();
      }
      return _fetchRoles();
    });
    return "Role Deleted successfully";
  }

  Future<String> addRole(
      {required String roleName, required List<String> permissionIDs}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final request = await ref.read(httpProvider).authenticatedRequest(
          url: "role",
          method: "POST",
          body: {"name": roleName, "permissions": permissionIDs});
      if (request.statusCode == 201) {
        ref.read(goRouterProvider).pop();
      }
      return _fetchRoles();
    });
    return "Role added successfully";
  }

  Future<String> updateRole(
      {required String roleName,
      required List<String> permissionIDs,
      required String id}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final request = await ref.read(httpProvider).authenticatedRequest(
          url: "role/$id",
          method: "PUT",
          body: {"name": roleName, "permissions": permissionIDs});
      if (request.statusCode == 200) {
        ref.read(goRouterProvider).pop();
      }
      return _fetchRoles();
    });
    return "Role updated successfully";
  }
}
