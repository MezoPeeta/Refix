import 'package:dashboard/src/screens/content/data/boarding_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/data/auth_data.dart';

part 'booking.freezed.dart';

part 'booking.g.dart';

@freezed
class Booking with _$Booking {
  const factory Booking({
    @JsonKey(name: "booking") required List<BookingElement> booking,
    @JsonKey(name: "count") required int count,
  }) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);
}

@freezed
class BookingElement with _$BookingElement {
  const factory BookingElement({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "services") required List<Service> services,
    @JsonKey(name: "customer") required User customer,
    Worker? worker,
    @JsonKey(name: "appointment_date") required DateTime appointmentDate,
    @JsonKey(name: "note") String? note,
    @JsonKey(name: "images_before_reaper")
    required List<String> imagesBeforeReaper,
    @JsonKey(name: "images_after_reaper", defaultValue: [])
    required List<String> imagesAfterReaper,
    @JsonKey(name: "description_problem") dynamic descriptionProblem,
    @JsonKey(name: "status") required String status,
    @JsonKey(name: "cost") required int cost,
    @JsonKey(name: "createdAt") required DateTime createdAt,
  }) = _BookingElement;

  factory BookingElement.fromJson(Map<String, dynamic> json) =>
      _$BookingElementFromJson(json);
}

@Freezed(toJson: true)
class Service with _$Service {
  const factory Service({
    @JsonKey(name: "name") Localized? name,
    @JsonKey(name: "details") Localized? details,
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "price") required int price,
    @JsonKey(name: "is_active") required bool isActive,
    @JsonKey(name: "image") required String image,
    @JsonKey(name: "type", defaultValue: "") String? type,
    @JsonKey(name: "createdAt") DateTime? createdAt,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}
