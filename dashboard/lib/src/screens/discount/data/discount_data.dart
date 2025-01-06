import 'package:freezed_annotation/freezed_annotation.dart';

import '../../content/data/boarding_data.dart';

part 'discount_data.freezed.dart';
part 'discount_data.g.dart';

@freezed
class Discount with _$Discount {
  const factory Discount(
      {@JsonKey(name: "_id") required String id,
      @JsonKey(name: "page_name") String? pageName,
      Localized? heading,
      Localized? details,
      double? discount,
      required bool active}) = _Discount;

  factory Discount.fromJson(Map<String, Object?> json) =>
      _$DiscountFromJson(json);
}
