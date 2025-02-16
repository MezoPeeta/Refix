// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAccountImpl _$$UserAccountImplFromJson(Map<String, dynamic> json) =>
    _$UserAccountImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      user: Worker.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserAccountImplToJson(_$UserAccountImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'user': instance.user,
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

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

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

_$TasksImpl _$$TasksImplFromJson(Map<String, dynamic> json) => _$TasksImpl(
      id: json['_id'] as String,
      services: (json['services'] as List<dynamic>)
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      customer: json['customer'] == null
          ? null
          : User.fromJson(json['customer'] as Map<String, dynamic>),
      cost: (json['cost'] as num?)?.toDouble() ?? 0,
      paymentMethod: json['payment_method'] as String? ?? 'CASH',
      imagesBeforeRepair: (json['images_before_reaper'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      appointmentDate: json['appointment_date'] == null
          ? null
          : DateTime.parse(json['appointment_date'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$TasksImplToJson(_$TasksImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'services': instance.services,
      'customer': instance.customer,
      'cost': instance.cost,
      'payment_method': instance.paymentMethod,
      'images_before_reaper': instance.imagesBeforeRepair,
      'appointment_date': instance.appointmentDate?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'status': instance.status,
    };

_$ServiceImpl _$$ServiceImplFromJson(Map<String, dynamic> json) =>
    _$ServiceImpl(
      name: json['name'] == null
          ? null
          : Localized.fromJson(json['name'] as Map<String, dynamic>),
      details: json['details'] == null
          ? null
          : Localized.fromJson(json['details'] as Map<String, dynamic>),
      id: json['_id'] as String,
      price: (json['price'] as num).toInt(),
      isActive: json['is_active'] as bool,
      image: json['image'] as String,
      type: json['type'] as String? ?? '',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ServiceImplToJson(_$ServiceImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'details': instance.details,
      '_id': instance.id,
      'price': instance.price,
      'is_active': instance.isActive,
      'image': instance.image,
      'type': instance.type,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$LocalizedImpl _$$LocalizedImplFromJson(Map<String, dynamic> json) =>
    _$LocalizedImpl(
      localized: json['localized'] as String?,
    );

Map<String, dynamic> _$$LocalizedImplToJson(_$LocalizedImpl instance) =>
    <String, dynamic>{
      'localized': instance.localized,
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
