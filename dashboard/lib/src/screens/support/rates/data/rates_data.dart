import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../booking/data/booking.dart';

part 'rates_data.freezed.dart';

part 'rates_data.g.dart';

@freezed
class Reviews with _$Reviews {
  const factory Reviews(
      {@JsonKey(name: "_id") required String id,
      @Default(0) int rating,
      required BookingElement booking,
      required DateTime createdAt
      }) = _Reviews;

  factory Reviews.fromJson(Map<String, dynamic> json) =>
      _$ReviewsFromJson(json);
}
