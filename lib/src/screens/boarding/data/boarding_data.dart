// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:refix/src/screens/home/data/home_data.dart';

part 'boarding_data.freezed.dart';
part 'boarding_data.g.dart';

@freezed
class Boarding with _$Boarding {
  const factory Boarding({
    @JsonKey(name: "_id") required String id,
    required String image,
    required Localized heading,
    required Localized details,
  }) = _Boarding;

  factory Boarding.fromJson(Map<String, Object?> json) =>
      _$BoardingFromJson(json);
}
