import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refix/src/screens/auth/data/auth_data.dart';

part 'reviews_data.freezed.dart';
part 'reviews_data.g.dart'; 

@freezed
class Review with _$Review {
  const factory Review({
    required double rating,
    String? comment,
    required User customer,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}