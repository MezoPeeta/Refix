// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingImpl _$$BookingImplFromJson(Map<String, dynamic> json) =>
    _$BookingImpl(
      booking: (json['booking'] as List<dynamic>)
          .map((e) => BookingElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$$BookingImplToJson(_$BookingImpl instance) =>
    <String, dynamic>{
      'booking': instance.booking,
      'count': instance.count,
    };

_$BookingElementImpl _$$BookingElementImplFromJson(Map<String, dynamic> json) =>
    _$BookingElementImpl(
      id: json['_id'] as String,
      services: (json['services'] as List<dynamic>)
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      customer: User.fromJson(json['customer'] as Map<String, dynamic>),
      worker: json['worker'] == null
          ? null
          : Worker.fromJson(json['worker'] as Map<String, dynamic>),
      appointmentDate: DateTime.parse(json['appointment_date'] as String),
      note: json['note'] as String?,
      imagesBeforeReaper: (json['images_before_reaper'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      imagesAfterReaper: (json['images_after_reaper'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      descriptionProblem: json['description_problem'],
      status: json['status'] as String,
      cost: (json['cost'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$BookingElementImplToJson(
        _$BookingElementImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'services': instance.services,
      'customer': instance.customer,
      'worker': instance.worker,
      'appointment_date': instance.appointmentDate.toIso8601String(),
      'note': instance.note,
      'images_before_reaper': instance.imagesBeforeReaper,
      'images_after_reaper': instance.imagesAfterReaper,
      'description_problem': instance.descriptionProblem,
      'status': instance.status,
      'cost': instance.cost,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_$ServiceImpl _$$ServiceImplFromJson(Map<String, dynamic> json) =>
    _$ServiceImpl(
      name: json['name'] == null
          ? null
          : Localized.fromJson(json['name'] as Map<String, dynamic>),
      details: json['details'] == null
          ? null
          : Localized.fromJson(json['details'] as Map<String, dynamic>),
      id: json['_id'] as String,
      price: (json['price'] as num).toInt(),
      isActive: json['is_active'] as bool,
      image: json['image'] as String,
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$$ServiceImplToJson(_$ServiceImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'details': instance.details,
      '_id': instance.id,
      'price': instance.price,
      'is_active': instance.isActive,
      'image': instance.image,
      'type': instance.type,
    };
