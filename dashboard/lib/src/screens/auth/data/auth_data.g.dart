// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAccountImpl _$$UserAccountImplFromJson(Map<String, dynamic> json) =>
    _$UserAccountImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserAccountImplToJson(_$UserAccountImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'user': instance.user,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      notificationToken: json['notification_token'] as String?,
      id: json['_id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      longitude: (json['lang'] as num?)?.toDouble(),
      latitude: (json['lat'] as num?)?.toDouble(),
      role: Role.fromJson(json['role'] as Map<String, dynamic>),
      isVerified: json['is_verified'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'notification_token': instance.notificationToken,
      '_id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'lang': instance.longitude,
      'lat': instance.latitude,
      'role': instance.role,
      'is_verified': instance.isVerified,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_$RoleImpl _$$RoleImplFromJson(Map<String, dynamic> json) => _$RoleImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$RoleImplToJson(_$RoleImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };

_$WorkerImpl _$$WorkerImplFromJson(Map<String, dynamic> json) => _$WorkerImpl(
      notificationToken: json['notification_token'] as String?,
      id: json['_id'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      companyName: json['company_name'] as String,
      phone: json['phone'] as String?,
      role: Role.fromJson(json['role'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WorkerImplToJson(_$WorkerImpl instance) =>
    <String, dynamic>{
      'notification_token': instance.notificationToken,
      '_id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'company_name': instance.companyName,
      'phone': instance.phone,
      'role': instance.role,
    };
