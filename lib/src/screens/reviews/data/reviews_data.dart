import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refix/src/screens/auth/data/auth_data.dart';

part 'reviews_data.freezed.dart';
part 'reviews_data.g.dart';

@freezed
class Review with _$Review {
  const factory Review({
    required double rating,
    String? comment,
    required ReviewCustomer customer,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

@freezed
class ReviewCustomer with _$ReviewCustomer {
  const factory ReviewCustomer({required String username}) = _ReviewCustomer;

  factory ReviewCustomer.fromJson(Map<String, dynamic> json) =>
      _$ReviewCustomerFromJson(json);
}
