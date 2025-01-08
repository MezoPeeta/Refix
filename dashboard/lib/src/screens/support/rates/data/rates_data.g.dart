// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rates_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewsImpl _$$ReviewsImplFromJson(Map<String, dynamic> json) =>
    _$ReviewsImpl(
      id: json['_id'] as String,
      rating: (json['rating'] as num?)?.toInt() ?? 0,
      booking: BookingElement.fromJson(json['booking'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ReviewsImplToJson(_$ReviewsImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'rating': instance.rating,
      'booking': instance.booking,
      'createdAt': instance.createdAt.toIso8601String(),
    };
