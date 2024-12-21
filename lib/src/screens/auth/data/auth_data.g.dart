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
      id: json['_id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      type: json['type'] as String,
      phone: json['phone'] as String,
      latitude: (json['lat'] as num?)?.toDouble(),
      longitude: (json['lang'] as num?)?.toDouble(),
      points: (json['points'] as num).toInt(),
      role: Role.fromJson(json['role'] as Map<String, dynamic>),
      isVerified: json['is_verified'] as bool,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'type': instance.type,
      'phone': instance.phone,
      'lat': instance.latitude,
      'lang': instance.longitude,
      'points': instance.points,
      'role': instance.role,
      'is_verified': instance.isVerified,
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

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      title: json['title'] as String,
      body: json['body'] as String,
      read: json['read'] as bool,
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'read': instance.read,
    };
