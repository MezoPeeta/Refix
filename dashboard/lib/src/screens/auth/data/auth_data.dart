import 'package:dashboard/src/screens/booking/data/booking.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'auth_data.freezed.dart';
part 'auth_data.g.dart';

@freezed
class UserAccount with _$UserAccount {
  const factory UserAccount({
    @JsonKey(name: "accessToken") required String accessToken,
    @JsonKey(name: "refreshToken") required String refreshToken,
    @JsonKey(name: "user") required User user,
  }) = _UserAccount;

  factory UserAccount.fromJson(Map<String, dynamic> json) =>
      _$UserAccountFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: "notification_token") String? notificationToken,
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "username") required String username,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "lang") double? longitude,
    @JsonKey(name: "lat") double? latitude,
    @JsonKey(name: "role") required Role role,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Role with _$Role {
  const factory Role({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "name") required String name,
    @PermissionConverter() List<Permission>? permissions,
  }) = _Role;

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
}

@unfreezed
class Permission with _$Permission {
  factory Permission(
      {@JsonKey(name: "_id") required String id,
      @JsonKey(name: "name") required String name,
      String? target,
      @Default(false) bool isSelected}) = _Permission;

  factory Permission.fromJson(Map<String, dynamic> json) =>
      _$PermissionFromJson(json);
}

@freezed
class Worker with _$Worker {
  const factory Worker({
    @JsonKey(name: "notification_token") String? notificationToken,
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "username") required String username,
    @JsonKey(name: "company_name") required String companyName,
    @TasksConverter() List<Tasks>? tasks,
    @JsonKey(name: "phone") String? phone,
  }) = _Worker;

  factory Worker.fromJson(Map<String, dynamic> json) => _$WorkerFromJson(json);
}

class TasksConverter implements JsonConverter<List<Tasks>, dynamic> {
  const TasksConverter();

  @override
  List<Tasks> fromJson(Object? json) {
    if (json is List) {
      return json.map((item) {
        if (item is Map<String, dynamic>) {
          return Tasks.fromJson(item);
        } else if (item is String) {
          return Tasks(
            id: item,
            status: "",
            services: [],
          );
        }
        throw Exception('Invalid Tasks format');
      }).toList();
    }
    return [];
  }

  @override
  dynamic toJson(List<Tasks> tasks) {
    return tasks.map((tasks) => tasks.toJson()).toList();
  }
}

class PermissionConverter implements JsonConverter<List<Permission>, dynamic> {
  const PermissionConverter();

  @override
  List<Permission> fromJson(Object? json) {
    if (json == null) {
      return [];
    }
    if (json is List) {
      return json.map((item) {
        if (item is Map<String, dynamic>) {
          return Permission.fromJson(item);
        } else if (item is String) {
          return Permission(id: item, name: '');
        }
        throw Exception('Invalid permission format');
      }).toList();
    }
    return [];
  }

  @override
  dynamic toJson(List<Permission> permissions) {
    return permissions.map((permission) => permission.toJson()).toList();
  }
}

@freezed
class Tasks with _$Tasks {
  const factory Tasks(
      {@JsonKey(name: "_id") required String id,
      required List<Service> services,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      required String status}) = _Tasks;

  factory Tasks.fromJson(Map<String, dynamic> json) => _$TasksFromJson(json);
}
