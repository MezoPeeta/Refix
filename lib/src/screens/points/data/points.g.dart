// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PointImpl _$$PointImplFromJson(Map<String, dynamic> json) => _$PointImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      percentage: (json['percentage'] as num).toInt(),
      requiredPoints: (json['required_points'] as num).toInt(),
      availableDays: (json['available_days'] as num).toInt(),
      active: json['active'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$$PointImplToJson(_$PointImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'percentage': instance.percentage,
      'required_points': instance.requiredPoints,
      'available_days': instance.availableDays,
      'active': instance.active,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };
