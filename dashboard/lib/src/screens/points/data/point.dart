import 'package:freezed_annotation/freezed_annotation.dart';

part 'point.freezed.dart';
part 'point.g.dart';

@freezed
class Point with _$Point {
    const factory Point({
        @JsonKey(name: "name")
        required String name,
        @JsonKey(name: "_id")
        required String id,
        @JsonKey(name: "percentage")
        required int percentage,
        @JsonKey(name: "required_points")
        required int requiredPoints,
        @JsonKey(name: "available_days")
        required int availableDays,
        @JsonKey(name: "active")
        required bool active,
        @JsonKey(name: "createdAt")
        required DateTime createdAt,
        @JsonKey(name: "updatedAt")
        required DateTime updatedAt,
       
    }) = _Point;

    factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
}