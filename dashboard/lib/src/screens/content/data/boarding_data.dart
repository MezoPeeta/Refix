// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'boarding_data.freezed.dart';
part 'boarding_data.g.dart';

@freezed
class Boarding with _$Boarding {
  const factory Boarding({
    @JsonKey(name: "_id") required String id,
    required String image,
    required String heading,
    required String details,
  }) = _Boarding;

  factory Boarding.fromJson(Map<String, Object?> json) =>
      _$BoardingFromJson(json);
}

class BoardingUpdate {
  final String id;
  final Uint8List image;
  final String headingEn;
  final String headingAr;
  final String detailsEn;
  final String detailsAr;

  const BoardingUpdate({
    required this.id,
    required this.image,
    required this.headingEn,
    required this.headingAr,
    required this.detailsEn,
    required this.detailsAr,
  });
}
