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

@Freezed(copyWith: true)
class User with _$User {
  const factory User({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "username") required String username,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "type") required String type,
    required String phone,
    @JsonKey(name: "lat") double? latitude,
    @JsonKey(name: "lang") double? longitude,
    required int points,
    @JsonKey(name: "is_verified") required bool isVerified,
    @JsonKey(name: "have_point_offer") required bool havePointsOffer,
    @JsonKey(name: "have_discount") required bool haveDiscount,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
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

  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
