import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refix/src/screens/home/data/home_data.dart';

part 'points.freezed.dart';
part 'points.g.dart';

@freezed
class Point with _$Point {
  const factory Point({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "name") required Localized name,
    @JsonKey(name: "details") Localized? details,
    @JsonKey(name: "percentage") required int percentage,
    @JsonKey(name: "required_points") required int requiredPoints,
    @JsonKey(name: "available_days") required int availableDays,
    @JsonKey(name: "active") required bool active,
  }) = _Point;

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
}

@freezed
class Offer with _$Offer {
  const factory Offer(
      {@JsonKey(name: "is_used", defaultValue: false) required bool isUsed,
      required Point point}) = _Offer;

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
}
