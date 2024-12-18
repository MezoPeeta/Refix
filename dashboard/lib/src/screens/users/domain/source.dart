import 'dart:convert';

import 'package:dashboard/src/core/navigation/api.dart';
import 'package:dashboard/src/core/navigation/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/data/auth_data.dart';

part 'source.g.dart';

class UsersDataSource extends DataTableSource {
  final List<User> data;
  UsersDataSource(this.data);

  String formatTime(DateTime time) {
    final formattedDate = DateFormat.yMd().format(time);
    final formattedTime = DateFormat('jm').format(time);
    return "$formattedTime $formattedDate";
  }

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) return null;

    return DataRow.byIndex(
        index: index,
        selected: data[index].selected,
        onSelectChanged: (value) {
          data[index].selected = value!;
          notifyListeners();
        },
        cells: [
          DataCell(Text(data[index].id)),
          DataCell(Text(data[index].username)),
          DataCell(Text(data[index].email)),
          DataCell(Text(formatTime(data[index].createdAt))),
          DataCell(TextButton(
            onPressed: () {},
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
    await ref.read(authProvider).logout();
    return [];
  }
  return [];
}
