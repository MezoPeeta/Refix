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

_$DiscountImpl _$$DiscountImplFromJson(Map<String, dynamic> json) =>
    _$DiscountImpl(
      pageName: json['page_name'] as String?,
      heading: json['heading'] == null
          ? null
          : Localized.fromJson(json['heading'] as Map<String, dynamic>),
      details: json['details'] == null
          ? null
          : Localized.fromJson(json['details'] as Map<String, dynamic>),
      discount: (json['discount'] as num?)?.toDouble(),
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$DiscountImplToJson(_$DiscountImpl instance) =>
    <String, dynamic>{
      'page_name': instance.pageName,
      'heading': instance.heading,
      'details': instance.details,
      'discount': instance.discount,
      'active': instance.active,
    };
