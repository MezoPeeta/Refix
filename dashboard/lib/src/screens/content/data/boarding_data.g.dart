// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boarding_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BoardingImpl _$$BoardingImplFromJson(Map<String, dynamic> json) =>
    _$BoardingImpl(
      id: json['_id'] as String,
      image: json['image'] as String,
      heading: Localized.fromJson(json['heading'] as Map<String, dynamic>),
      details: Localized.fromJson(json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BoardingImplToJson(_$BoardingImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'image': instance.image,
      'heading': instance.heading,
      'details': instance.details,
    };

_$LocalizedImpl _$$LocalizedImplFromJson(Map<String, dynamic> json) =>
    _$LocalizedImpl(
      en: json['en'] as String,
      ar: json['ar'] as String,
    );

Map<String, dynamic> _$$LocalizedImplToJson(_$LocalizedImpl instance) =>
    <String, dynamic>{
      'en': instance.en,
      'ar': instance.ar,
    };
