import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_data.freezed.dart';

part 'home_data.g.dart';

@Freezed(toJson: true)
class Ad with _$Ad {
  const factory Ad({
    @JsonKey(name: "image") required String image,
    @JsonKey(name: "type") required String type,
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "createdAt") required DateTime createdAt,
    @JsonKey(name: "updatedAt") required DateTime updatedAt,
    @JsonKey(name: "__v") required int v,
  }) = _Ad;

  factory Ad.fromJson(Map<String, dynamic> json) => _$AdFromJson(json);
}

@Freezed(toJson: true)
class Service with _$Service {
  const factory Service({
    @JsonKey(name: "name") required Localized name,
    @JsonKey(name: "details") required Localized details,
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "price") required int price,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "is_active") required bool isActive,
    @JsonKey(name: "image") required String image,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}

@Freezed(toJson: true)
class Localized with _$Localized {
  const factory Localized({
    @JsonKey(name: "localized", defaultValue: "") required String localized,
  }) = _Localized;

  factory Localized.fromJson(Map<String, dynamic> json) =>
      _$LocalizedFromJson(json);
}
