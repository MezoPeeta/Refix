// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiscountImpl _$$DiscountImplFromJson(Map<String, dynamic> json) =>
    _$DiscountImpl(
      id: json['_id'] as String,
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
      '_id': instance.id,
      'page_name': instance.pageName,
      'heading': instance.heading,
      'details': instance.details,
      'discount': instance.discount,
      'active': instance.active,
    };
