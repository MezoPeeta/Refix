// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdImpl _$$AdImplFromJson(Map<String, dynamic> json) => _$AdImpl(
      image: json['image'] as String,
      type: json['type'] as String,
      id: json['_id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$$AdImplToJson(_$AdImpl instance) => <String, dynamic>{
      'image': instance.image,
      'type': instance.type,
      '_id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };

_$ServiceImpl _$$ServiceImplFromJson(Map<String, dynamic> json) =>
    _$ServiceImpl(
      name: Localized.fromJson(json['name'] as Map<String, dynamic>),
      details: Localized.fromJson(json['details'] as Map<String, dynamic>),
      id: json['_id'] as String,
      price: (json['price'] as num).toInt(),
      type: json['type'] as String?,
      isActive: json['is_active'] as bool,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$ServiceImplToJson(_$ServiceImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'details': instance.details,
      '_id': instance.id,
      'price': instance.price,
      'type': instance.type,
      'is_active': instance.isActive,
      'image': instance.image,
    };

_$LocalizedImpl _$$LocalizedImplFromJson(Map<String, dynamic> json) =>
    _$LocalizedImpl(
      localized: json['localized'] as String? ?? '',
    );

Map<String, dynamic> _$$LocalizedImplToJson(_$LocalizedImpl instance) =>
    <String, dynamic>{
      'localized': instance.localized,
    };
