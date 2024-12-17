import 'dart:convert';

import 'package:dashboard/src/core/navigation/api.dart';
import 'package:dashboard/src/core/navigation/auth.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/data/auth_data.dart';

part 'source.g.dart';

class UsersDataSource extends DataTableSource {
  final List<User> data;
  UsersDataSource(this.data);

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].id)),
      DataCell(Text(data[index].username)),
      DataCell(Text(data[index].email)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 20;
}

@riverpod
Future<List<User>> getUsers(Ref ref) async {
  final response = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "customer?page=1&take=20", method: "GET");

  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body);

    return decoded.map<User>((e) => User.fromJson(e)).toList();
  }
  if (response.statusCode == 401) {
    await ref.read(authProvider).logout();
    return [];
  }
  return [];
}
