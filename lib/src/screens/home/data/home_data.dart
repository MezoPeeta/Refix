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

@freezed
class Service with _$Service {
  const factory Service({
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "details") required String details,
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "price") required int price,
    @JsonKey(name: "is_active") required bool isActive,
    @JsonKey(name: "childService") required List<Service> childService,
    @JsonKey(name: "image") required String image,
    @JsonKey(name: "__v") required int v,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}
