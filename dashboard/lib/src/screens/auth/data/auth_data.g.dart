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
      isVerified: json['is_verified'] as bool? ?? false,
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
      permissions: const PermissionConverter().fromJson(json['permissions']),
    );

Map<String, dynamic> _$$RoleImplToJson(_$RoleImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'permissions': _$JsonConverterToJson<dynamic, List<Permission>>(
          instance.permissions, const PermissionConverter().toJson),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$PermissionImpl _$$PermissionImplFromJson(Map<String, dynamic> json) =>
    _$PermissionImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      target: json['target'] as String?,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$PermissionImplToJson(_$PermissionImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'target': instance.target,
      'isSelected': instance.isSelected,
    };

_$WorkerImpl _$$WorkerImplFromJson(Map<String, dynamic> json) => _$WorkerImpl(
      notificationToken: json['notification_token'] as String?,
      id: json['_id'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      companyName: json['company_name'] as String,
      tasks: const TasksConverter().fromJson(json['tasks']),
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$$WorkerImplToJson(_$WorkerImpl instance) =>
    <String, dynamic>{
      'notification_token': instance.notificationToken,
      '_id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'company_name': instance.companyName,
      'tasks': _$JsonConverterToJson<dynamic, List<Tasks>>(
          instance.tasks, const TasksConverter().toJson),
      'phone': instance.phone,
    };

_$TasksImpl _$$TasksImplFromJson(Map<String, dynamic> json) => _$TasksImpl(
      id: json['_id'] as String,
      services: (json['services'] as List<dynamic>)
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$TasksImplToJson(_$TasksImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'services': instance.services,
      'createdAt': instance.createdAt?.toIso8601String(),
      'status': instance.status,
    };
