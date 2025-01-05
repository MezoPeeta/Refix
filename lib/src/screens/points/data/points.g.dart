// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PointImpl _$$PointImplFromJson(Map<String, dynamic> json) => _$PointImpl(
      id: json['_id'] as String,
      name: Localized.fromJson(json['name'] as Map<String, dynamic>),
      details: json['details'] == null
          ? null
          : Localized.fromJson(json['details'] as Map<String, dynamic>),
      percentage: (json['percentage'] as num).toInt(),
      requiredPoints: (json['required_points'] as num).toInt(),
      availableDays: (json['available_days'] as num).toInt(),
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$PointImplToJson(_$PointImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'details': instance.details,
      'percentage': instance.percentage,
      'required_points': instance.requiredPoints,
      'available_days': instance.availableDays,
      'active': instance.active,
    };

_$OfferImpl _$$OfferImplFromJson(Map<String, dynamic> json) => _$OfferImpl(
      isUsed: json['is_used'] as bool? ?? false,
      point: Point.fromJson(json['point'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OfferImplToJson(_$OfferImpl instance) =>
    <String, dynamic>{
      'is_used': instance.isUsed,
      'point': instance.point,
    };
