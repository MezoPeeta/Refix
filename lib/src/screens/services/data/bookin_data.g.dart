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
      note: json['note'] as String?,
      imagesBeforeReaper: (json['images_before_reaper'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      reviewed: json['reviewed'] as bool? ?? false,
      problemResolved: json['problem_not_resolved'] as String?,
      imagesAfterReaper: json['images_after_reaper'] as List<dynamic>,
      descriptionProblem: json['description_problem'],
      status: json['status'] as String,
      cost: (json['cost'] as num).toInt(),
      paymentMethod: json['payment_method'] as String?,
      isPaid: json['is_paid'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$BookingImplToJson(_$BookingImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'services': instance.services,
      'customer': instance.customer,
      'appointment_date': instance.appointmentDate.toIso8601String(),
      'note': instance.note,
      'images_before_reaper': instance.imagesBeforeReaper,
      'reviewed': instance.reviewed,
      'problem_not_resolved': instance.problemResolved,
      'images_after_reaper': instance.imagesAfterReaper,
      'description_problem': instance.descriptionProblem,
      'status': instance.status,
      'cost': instance.cost,
      'payment_method': instance.paymentMethod,
      'is_paid': instance.isPaid,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
