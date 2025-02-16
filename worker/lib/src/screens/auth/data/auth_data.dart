// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'auth_data.freezed.dart';
part 'auth_data.g.dart';

@freezed
class UserAccount with _$UserAccount {
  const factory UserAccount({
    @JsonKey(name: "accessToken") required String accessToken,
    @JsonKey(name: "refreshToken") required String refreshToken,
    @JsonKey(name: "user") required Worker user,
  }) = _UserAccount;

  factory UserAccount.fromJson(Map<String, dynamic> json) =>
      _$UserAccountFromJson(json);
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

@freezed
class Role with _$Role {
  const factory Role({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "name") required String name,
  }) = _Role;

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
}

@unfreezed
class Notification with _$Notification {
  factory Notification({
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "body") required String body,
    @JsonKey(name: "read") required bool read,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
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
            paymentMethod: "CASH",
            cost: 0,
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

@freezed
class Tasks with _$Tasks {
  const factory Tasks(
      {@JsonKey(name: "_id") required String id,
      required List<Service> services,
      User? customer,
      @Default(0) double cost,
      @JsonKey(name: "payment_method", defaultValue: "CASH")
      required String paymentMethod,
      @JsonKey(name: "images_before_reaper", defaultValue: [])
      List<String>? imagesBeforeRepair,
      @JsonKey(name: "appointment_date") DateTime? appointmentDate,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      required String status}) = _Tasks;

  factory Tasks.fromJson(Map<String, dynamic> json) => _$TasksFromJson(json);
}

@Freezed(toJson: true)
class Service with _$Service {
  const factory Service({
    @JsonKey(name: "name") Localized? name,
    @JsonKey(name: "details") Localized? details,
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "price") required int price,
    @JsonKey(name: "is_active") required bool isActive,
    @JsonKey(name: "image") required String image,
    @JsonKey(name: "type", defaultValue: "") String? type,
    @JsonKey(name: "createdAt") DateTime? createdAt,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}

@freezed
class Localized with _$Localized {
  const factory Localized({
    String? localized,
  }) = _Localized;

  factory Localized.fromJson(Map<String, Object?> json) =>
      _$LocalizedFromJson(json);
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
    @JsonKey(
      name: "role",
    )
    required Role role,
    @JsonKey(name: "is_verified", defaultValue: false) required bool isVerified,
    @JsonKey(name: "createdAt") required DateTime createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
