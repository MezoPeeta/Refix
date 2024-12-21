

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/data/auth_data.dart';
import '../../home/data/home_data.dart';

part 'bookin_data.g.dart';
part 'bookin_data.freezed.dart';


@freezed
class Booking with _$Booking {
    const factory Booking({
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
    }) = _Booking;

    factory Booking.fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);
}