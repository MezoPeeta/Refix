// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PointImpl _$$PointImplFromJson(Map<String, dynamic> json) => _$PointImpl(
      name: Localized.fromJson(json['name'] as Map<String, dynamic>),
      details: json['details'] == null
          ? null
          : Localized.fromJson(json['details'] as Map<String, dynamic>),
      id: json['_id'] as String,
      percentage: (json['percentage'] as num).toInt(),
      requiredPoints: (json['required_points'] as num).toInt(),
      availableDays: (json['available_days'] as num).toInt(),
      active: json['active'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PointImplToJson(_$PointImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'details': instance.details,
      '_id': instance.id,
      'percentage': instance.percentage,
      'required_points': instance.requiredPoints,
      'available_days': instance.availableDays,
      'active': instance.active,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
