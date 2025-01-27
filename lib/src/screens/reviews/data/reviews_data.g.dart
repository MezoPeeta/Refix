// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'] as String?,
      customer:
          ReviewCustomer.fromJson(json['customer'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'comment': instance.comment,
      'customer': instance.customer,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$ReviewCustomerImpl _$$ReviewCustomerImplFromJson(Map<String, dynamic> json) =>
    _$ReviewCustomerImpl(
      username: json['username'] as String,
    );

Map<String, dynamic> _$$ReviewCustomerImplToJson(
        _$ReviewCustomerImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
    };
