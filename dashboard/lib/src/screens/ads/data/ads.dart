import 'package:freezed_annotation/freezed_annotation.dart';

part 'ads.freezed.dart';

part 'ads.g.dart';

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
