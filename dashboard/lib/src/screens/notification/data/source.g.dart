// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationsImpl _$$NotificationsImplFromJson(Map<String, dynamic> json) =>
    _$NotificationsImpl(
      name: json['name'] as String,
      details: json['details'] as String,
      dateSent: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$NotificationsImplToJson(_$NotificationsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'details': instance.details,
      'created_at': instance.dateSent.toIso8601String(),
    };
