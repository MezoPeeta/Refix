

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/data/auth_data.dart';

part 'booking.freezed.dart';

part 'booking.g.dart';

@freezed
class Booking with _$Booking {
    const factory Booking({
        @JsonKey(name: "booking")
        required List<BookingElement> booking,
        @JsonKey(name: "count")
        required int count,
    }) = _Booking;

    factory Booking.fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);
}

@freezed
class BookingElement with _$BookingElement {
    const factory BookingElement({
        @JsonKey(name: "_id")
        required String id,
        @JsonKey(name: "services")
        required List<Service> services,
        @JsonKey(name: "customer")
        required User customer,
        @JsonKey(name: "appointment_date")
        required DateTime appointmentDate,
        @JsonKey(name: "notes")
        required String notes,
        @JsonKey(name: "images_before_reaper")
        required List<String> imagesBeforeReaper,
        @JsonKey(name: "images_after_reaper")
        required List<dynamic> imagesAfterReaper,
        @JsonKey(name: "description_problem")
        required dynamic descriptionProblem,
        @JsonKey(name: "status")
        required String status,
        @JsonKey(name: "cost")
        required int cost,
        @JsonKey(name: "createdAt")
        required DateTime createdAt,
        @JsonKey(name: "updatedAt")
        required DateTime updatedAt,
        @JsonKey(name: "__v")
        required int v,
    }) = _BookingElement;

    factory BookingElement.fromJson(Map<String, dynamic> json) => _$BookingElementFromJson(json);
}

@Freezed(toJson: true)
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
