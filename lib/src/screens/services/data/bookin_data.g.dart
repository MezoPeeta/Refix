// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookin_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingImpl _$$BookingImplFromJson(Map<String, dynamic> json) =>
    _$BookingImpl(
      id: json['_id'] as String,
      services: (json['services'] as List<dynamic>)
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      customer: User.fromJson(json['customer'] as Map<String, dynamic>),
      appointmentDate: DateTime.parse(json['appointment_date'] as String),
      notes: json['notes'] as String,
      imagesBeforeReaper: (json['images_before_reaper'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      imagesAfterReaper: json['images_after_reaper'] as List<dynamic>,
      descriptionProblem: json['description_problem'],
      status: json['status'] as String,
      cost: (json['cost'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$$BookingImplToJson(_$BookingImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'services': instance.services,
      'customer': instance.customer,
      'appointment_date': instance.appointmentDate.toIso8601String(),
      'notes': instance.notes,
      'images_before_reaper': instance.imagesBeforeReaper,
      'images_after_reaper': instance.imagesAfterReaper,
      'description_problem': instance.descriptionProblem,
      'status': instance.status,
      'cost': instance.cost,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };
