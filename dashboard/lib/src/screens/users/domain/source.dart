import 'dart:convert';

import 'package:dashboard/src/core/navigation/api.dart';
import 'package:dashboard/src/core/navigation/auth.dart';
import 'package:dashboard/src/screens/auth/data/roles.dart';
import 'package:dashboard/src/screens/booking/data/booking.dart';
import 'package:dashboard/src/screens/booking/presentation/booking.dart';
import 'package:dashboard/src/screens/navbar/navbar.dart';
import 'package:dashboard/src/screens/points/add_point.dart';
import 'package:dashboard/src/screens/points/data/point.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/data/auth_data.dart';
import 'package:http/http.dart' as http;

part 'source.g.dart';

class UsersDataSource extends DataTableSource {
  final List<User> data;
  final BuildContext context;
  UsersDataSource(this.data, this.context);

  String formatTime(DateTime time) {
    final formattedDate = DateFormat.yMd().format(time);
    final formattedTime = DateFormat('jm').format(time);
    return "$formattedTime $formattedDate";
  }

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) return null;

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(data[index].id)),
      DataCell(Text(data[index].username)),
      DataCell(Text(data[index].email)),
      DataCell(Text(data[index].phone ?? "-")),
      DataCell(Text(formatTime(data[index].createdAt))),
      DataCell(TextButton(
        onPressed: () => context.push("/user/edit", extra: data[index]),
        child: const Text("Edit"),
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 5;
}

@riverpod
Future<List<User>> getCustomers(Ref ref,
    {required int page, String? query}) async {
  final url = query != null
      ? "customer?page=$page&take=10&search=$query"
      : "customer?page=$page&take=10";
  final response = await ref
      .read(httpProvider)
      .authenticatedRequest(url: url, method: "GET");
  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body)["customers"];

    return decoded.map<User>((e) => User.fromJson(e)).toList();
  }
  if (response.statusCode == 401) {
    ref.read(authProvider).refreshAccessToken();
    getCustomers(ref, page: page);
    return [];
  }
  return [];
}

@riverpod
Future<List<User>> getUsers(Ref ref, {required int page, String? query}) async {
  final url = query != null
      ? "user?page=$page&take=10&search=$query"
      : "user?page=$page&take=10";
  final response = await ref
      .read(httpProvider)
      .authenticatedRequest(url: url, method: "GET");
  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body)["users"];

    return decoded.map<User>((e) => User.fromJson(e)).toList();
  }
  if (response.statusCode == 401) {
    ref.read(authProvider).refreshAccessToken();
    getUsers(ref, page: page);
    return [];
  }
  return [];
}

@riverpod
Future<List<String>> getLocation(Ref ref, {required List<User> users}) async {
  List<String> cities = [];
  users.forEach((user) async {
    final request = await http.get(Uri.parse(
        "https://nominatim.openstreetmap.org/reverse?format=json&lat=${user.latitude}&lon=${user.longitude}"));
    final data = jsonDecode(request.body);
    if (request.statusCode == 200) {
      // return data["address"]["city"];
      cities.add(data["address"]["city"]);
    }
  });

  return cities;
}

class CustomersDataSource extends UsersDataSource {
  CustomersDataSource(super.data, super.context);

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) return null;

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(data[index].id)),
      DataCell(Text(data[index].username)),
      DataCell(Text(data[index].email)),
      DataCell(Text(data[index].role.name)),
      DataCell(Text(formatTime(data[index].createdAt))),
      DataCell(TextButton(
        onPressed: () {},
        child: const Text("Edit"),
      )),
    ]);
  }
}

class BookingDataSource extends DataTableSource {
  List<BookingElement> bookings;

  WidgetRef ref;
  BookingDataSource(this.ref, this.bookings);

  String formatTime(DateTime time) {
    final formattedDate = DateFormat.yMd().format(time);
    final formattedTime = DateFormat('jm').format(time);
    return "$formattedTime $formattedDate";
  }

  @override
  DataRow? getRow(int index) {
    if (index >= bookings.length) return null;

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(bookings[index].id)),
      DataCell(Text(bookings[index].services.first.name)),
      DataCell(Text(bookings[index].customer.username)),
      DataCell(Text(bookings[index].cost.toString())),
      DataCell(Text(formatTime(bookings[index].createdAt))),
      DataCell(Text(bookings[index].status)),
      DataCell(TextButton(
        onPressed: () {
          ref.read(currentIndexProvider.notifier).state = 11;
          ref.read(getBookingInfoProvider.notifier).state = bookings[index];
        },
        child: const Text("Show"),
      )),
    ]);
  }

  @override
  int get rowCount => bookings.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 10;
}

class BookingConfDataSource extends DataTableSource {
  List<BookingElement> bookings;

  WidgetRef ref;
  BookingConfDataSource(this.ref, this.bookings);
  String formatTime(DateTime time) {
    final formattedDate = DateFormat.yMd().format(time);
    final formattedTime = DateFormat('jm').format(time);
    return "$formattedTime $formattedDate";
  }

  @override
  DataRow? getRow(int index) {
    if (index >= bookings.length) return null;

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(bookings[index].id)),
      DataCell(Text(bookings[index].services.first.name)),
      DataCell(Text(bookings[index].customer.username)),
      DataCell(Text(bookings[index].cost.toString())),
      DataCell(Text(formatTime(bookings[index].createdAt))),
      DataCell(Text(bookings[index].status)),
      DataCell(TextButton(
        onPressed: () {
          ref.read(currentIndexProvider.notifier).state = 13;
          ref.read(getBookingInfoProvider.notifier).state = bookings[index];
        },
        child: const Text("Show"),
      )),
    ]);
  }

  @override
  int get rowCount => bookings.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 10;
}

class PointsDataSource extends DataTableSource {
  WidgetRef ref;
  List<Point> data;
  PointsDataSource(this.data, this.ref);
  String formatTime(DateTime time) {
    final formattedDate = DateFormat.yMd().format(time);
    final formattedTime = DateFormat('jm').format(time);
    return "$formattedTime $formattedDate";
  }

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) return null;

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(data[index].id)),
      DataCell(Text(data[index].name)),
      DataCell(Text("${data[index].percentage}%")),
      DataCell(Text(data[index].availableDays.toString())),
      DataCell(Text(data[index].requiredPoints.toString())),
      DataCell(Text(formatTime(data[index].createdAt))),
      DataCell(Text(data[index].active ? "Active" : "Inactive")),
      DataCell(TextButton(
        onPressed: () {
          ref.read(pointIDProvider.notifier).state = data[index];
          ref.read(currentIndexProvider.notifier).state = 9;
        },
        child: const Text("Edit"),
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 10;
}

@riverpod
Future<List<BookingElement>> getUnAssignedBookings(Ref ref,
    {required int page, String? query}) async {
  final url = query != null
      ? "booking/not-assigned?page=$page&take=10&search=$query"
      : "booking/not-assigned?page=$page&take=10";
  final response = await ref
      .read(httpProvider)
      .authenticatedRequest(url: url, method: "GET");
  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body)["booking"] as List;

    final List<BookingElement> bookings = await Future.wait(
      decoded.map<Future<BookingElement>>(
        (e) async {
          final roleData = e["customer"]["role"];
          final role =
              await ref.read(convertRoleProvider(data: roleData).future);
          final customerData = Map<String, dynamic>.from(e["customer"]);
          customerData["role"] = role!.toJson();
          final bookingData = Map<String, dynamic>.from(e);
          bookingData["customer"] = customerData;
          return BookingElement.fromJson(bookingData);
        },
      ),
    );

    return bookings;
  }
  if (response.statusCode == 401) {
    ref.read(authProvider).refreshAccessToken();
    getUnAssignedBookings(ref, page: page);
    return [];
  }
  return [];
}

@riverpod
Future<List<BookingElement>> getBookings(Ref ref,
    {required int page, String? query}) async {
  final url = query != null
      ? "booking?page=$page&take=10&search=$query"
      : "booking?page=$page&take=10";
  final response = await ref
      .read(httpProvider)
      .authenticatedRequest(url: url, method: "GET");
  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body)["booking"] as List;

    final List<BookingElement> bookings = await Future.wait(
      decoded.map<Future<BookingElement>>(
        (e) async {
          final roleData = e["customer"]["role"];
          final role =
              await ref.read(convertRoleProvider(data: roleData).future);
          final customerData = Map<String, dynamic>.from(e["customer"]);
          customerData["role"] = role!.toJson();
          final bookingData = Map<String, dynamic>.from(e);
          bookingData["customer"] = customerData;
          return BookingElement.fromJson(bookingData);
        },
      ),
    );

    return bookings;
  }
  if (response.statusCode == 401) {
    ref.read(authProvider).refreshAccessToken();
    getBookings(ref, page: page);
    return [];
  }
  return [];
}

@riverpod
Future<Role?> convertRole(Ref ref, {required Object? data}) async {
  if (data is String) {
    return await ref.read(getRoleByIDProvider(id: data).future);
  }
  if (data is Map<String, dynamic>) {
    return Role.fromJson(data);
  }
  return null;
}

class WorkersDataTable extends DataTableSource {
  final List<Worker> data;
  final BuildContext context;
  WorkersDataTable(this.data, this.context);

  String formatTime(DateTime time) {
    final formattedDate = DateFormat.yMd().format(time);
    final formattedTime = DateFormat('jm').format(time);
    return "$formattedTime $formattedDate";
  }

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) return null;
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(data[index].id)),
      DataCell(Text(data[index].username)),
      DataCell(Text(data[index].companyName)),
      DataCell(Text(data[index].phone ?? "-")),
      DataCell(TextButton(
        onPressed: () => context.push("/tasks", extra: data[index]),
        child: const Text("Show"),
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 5;
}

@riverpod
Future<String?> assignWorkerToBooking(Ref ref,
    {required String bookingID, required String workerID}) async {
  final response = await ref.read(httpProvider).authenticatedRequest(
      url: "booking/$bookingID/$workerID/assign", method: "PATCH");
  final data = response.body;

  if (response.statusCode == 200) {
    return data;
  }

  return "Failed: ${jsonDecode(data)["message"]}";
}
