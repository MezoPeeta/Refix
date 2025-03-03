import 'dart:convert';

import 'package:dashboard/src/core/navigation/api.dart';
import 'package:dashboard/src/core/navigation/auth.dart';
import 'package:dashboard/src/screens/auth/data/roles.dart';
import 'package:dashboard/src/screens/booking/data/booking.dart';
import 'package:dashboard/src/screens/booking/presentation/booking.dart';
import 'package:dashboard/src/screens/discount/data/discount_data.dart';
import 'package:dashboard/src/screens/navbar/navbar.dart';
import 'package:dashboard/src/screens/points/add_point.dart';
import 'package:dashboard/src/screens/points/data/point.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/navigation/routes.dart';
import '../../auth/data/auth_data.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../services/services_edit.dart';
import '../tasks.dart';

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
      DataCell(SelectableText(data[index].id)),
      DataCell(SelectableText(data[index].username)),
      DataCell(SelectableText(data[index].email)),
      DataCell(SelectableText(data[index].phone ?? "")),
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
      DataCell(SelectableText(data[index].id)),
      DataCell(SelectableText(data[index].username)),
      DataCell(SelectableText(data[index].email)),
      DataCell(SelectableText(data[index].role.name)),
      DataCell(TextButton(
        onPressed: () => context.push("/permission/edit", extra: data[index]),
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
    // Convert UTC time to Saudi Arabia Time (UTC+3)
    DateTime saudiTime = time.add(const Duration(hours: 3));

    // Format the date and time
    final formattedDate = DateFormat.yMd().format(saudiTime);
    final formattedTime = DateFormat('jm').format(saudiTime);

    return "$formattedTime $formattedDate";
  }

  @override
  DataRow? getRow(int index) {
    if (index >= bookings.length) return null;

    return DataRow.byIndex(index: index, cells: [
      DataCell(SelectableText(bookings[index].id)),
      DataCell(SelectableText(bookings[index].services.first.name?.en ?? "")),
      DataCell(SelectableText(bookings[index].customer.username)),
      DataCell(SelectableText(bookings[index].cost.toString())),
      DataCell(SelectableText(formatTime(bookings[index].createdAt))),
      DataCell(SelectableText(bookings[index].status)),
      DataCell(TextButton(
        onPressed: () {
          ref.read(currentIndexProvider.notifier).state = 12;
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
    // Convert UTC time to Saudi Arabia Time (UTC+3)
    DateTime saudiTime = time.add(const Duration(hours: 3));

    // Format the date and time
    final formattedDate = DateFormat.yMd().format(saudiTime);
    final formattedTime = DateFormat('jm').format(saudiTime);

    return "$formattedTime $formattedDate";
  }

  @override
  DataRow? getRow(int index) {
    if (index >= bookings.length) return null;

    return DataRow.byIndex(index: index, cells: [
      DataCell(SelectableText(bookings[index].id)),
      DataCell(SelectableText(bookings[index].services.first.name?.en ?? "")),
      DataCell(SelectableText(bookings[index].customer.username)),
      DataCell(SelectableText(bookings[index].cost.toString())),
      DataCell(SelectableText(formatTime(bookings[index].createdAt))),
      DataCell(SelectableText(bookings[index].status)),
      DataCell(TextButton(
        onPressed: () {
          ref.read(currentIndexProvider.notifier).state = 14;
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
    // Convert UTC time to Saudi Arabia Time (UTC+3)
    DateTime saudiTime = time.add(const Duration(hours: 3));

    // Format the date and time
    final formattedDate = DateFormat.yMd().format(saudiTime);
    final formattedTime = DateFormat('jm').format(saudiTime);

    return "$formattedTime $formattedDate";
  }

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) return null;

    return DataRow.byIndex(index: index, cells: [
      DataCell(SelectableText(data[index].id)),
      DataCell(SelectableText(data[index].name.en)),
      DataCell(SelectableText("${data[index].percentage}%")),
      DataCell(SelectableText(data[index].availableDays.toString())),
      DataCell(SelectableText(data[index].requiredPoints.toString())),
      DataCell(SelectableText(formatTime(data[index].createdAt))),
      DataCell(SelectableText(data[index].active ? "Active" : "Inactive")),
      DataCell(TextButton(
        onPressed: () {
          ref.read(pointIDProvider.notifier).state = data[index];
          ref.read(currentIndexProvider.notifier).state = 10;
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
  final WidgetRef ref;
  WorkersDataTable(this.data, this.context, this.ref);

  String formatTime(DateTime time) {
    final formattedDate = DateFormat.yMd().format(time);
    final formattedTime = DateFormat('jm').format(time);
    return "$formattedTime $formattedDate";
  }

  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(SelectableText(data[index].id)),
      DataCell(SelectableText(data[index].username)),
      DataCell(SelectableText(data[index].companyName)),
      DataCell(SelectableText(data[index].phone ?? "")),
      DataCell(TextButton(
        onPressed: () {
          ref.read(workerProvider.notifier).state = data[index];
          ref.read(goRouterProvider).push("/tasks");
        },
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
    ref.read(goRouterProvider).pop();
    return data;
  }

  return "Failed: ${jsonDecode(data)["message"]}";
}

class DiscountTableSource extends DataTableSource {
  final List<Discount> data;
  final BuildContext context;
  DiscountTableSource(this.data, this.context);

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) return null;
    return DataRow.byIndex(index: index, cells: [
      DataCell(SelectableText(data[index].pageName ?? "")),
      DataCell(SizedBox(
          width: 200,
          child: Text(
            data[index].heading?.en ?? "",
            overflow: TextOverflow.ellipsis,
          ))),
      DataCell(SizedBox(
          width: 200,
          child: Text(
            data[index].heading?.ar ?? "",
            overflow: TextOverflow.ellipsis,
          ))),
      DataCell(SizedBox(
          width: 200,
          child: Text(
            data[index].details?.en ?? "",
            overflow: TextOverflow.ellipsis,
          ))),
      DataCell(SizedBox(
          width: 200,
          child: Text(
            data[index].details?.ar ?? "",
            overflow: TextOverflow.ellipsis,
          ))),
      DataCell(SizedBox(
          child: Text(
        data[index].active ? "Active" : "Inactive",
      ))),
      DataCell(TextButton(
        onPressed: () => context.push("/discount/edit", extra: data[index]),
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
Future<String> updateBooking(Ref ref, {required BookingElement booking}) async {
  final request = await ref.read(httpProvider).authenticatedRequest(
      url: "booking/${booking.id}", method: "PATCH", body: booking.toJson());
  return getResponseMessage(jsonDecode(request.body));
}

String getResponseMessage(dynamic message) {
  if (message is String) {
    return message;
  }

  if (message is Map<String, dynamic>) {
    final mess = message["message"];
    if (mess is List) {
      return mess.first;
    }
    return mess;
  }

  return message;
}

class RuleDataSource extends DataTableSource {
  final List<Role> data;
  final BuildContext context;
  RuleDataSource(this.data, this.context);

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) return null;
    return DataRow.byIndex(index: index, cells: [
      DataCell(SelectableText(data[index].id)),
      DataCell(SelectableText(data[index].name)),
      DataCell(TextButton(
        onPressed: () => context.push("/rule/edit", extra: data[index]),
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

class ServicesDataTable extends DataTableSource {
  final List<Service> data;
  final BuildContext context;
  final WidgetRef ref;
  ServicesDataTable(this.data, this.context,this.ref);
  String formatTime(DateTime time) {
    final formattedDate = DateFormat.yMd().format(time);
    final formattedTime = DateFormat('jm').format(time);
    return "$formattedTime $formattedDate";
  }

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) return null;
    return DataRow.byIndex(index: index, cells: [
      DataCell(SelectableText(data[index].id)),
      DataCell(CircleAvatar(
        backgroundImage:
            NetworkImage("https://api.refixapp.com/${data[index].image}"),
      )),
      DataCell(SelectableText(data[index].name?.en ?? "")),
      DataCell(SelectableText(data[index].type ?? "")),
      DataCell(SelectableText("${data[index].price} SAR")),
      DataCell(SelectableText(data[index].isActive ? "Active" : "Inactive")),
      DataCell(TextButton(
        onPressed: () async{
          final image = "https://api.refixapp.com/${data[index].image}";
          ref.read(imageBytesProvider.notifier).state = await convertNetworkImage(image);
          context.push("/services/edit", extra: data[index]);
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

  Future<Uint8List> convertNetworkImage(String image) async{
    http.Response response = await http.get(Uri.parse(image));
  return response.bodyBytes;
  }
