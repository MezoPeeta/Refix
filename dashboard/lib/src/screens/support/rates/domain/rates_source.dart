import 'package:dashboard/src/screens/support/rates/data/rates_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class RatesDataSource extends DataTableSource {
  WidgetRef ref;
  List<Reviews> data;
  RatesDataSource(this.data, this.ref);
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
      DataCell(Text(data[index].booking.services.first.name?.en ?? "-")),
      DataCell(Text(data[index].booking.worker?.username ?? "-")),
      DataCell(Text(data[index].booking.customer.username)),
      DataCell(Text("${data[index].rating}" " /5")),
      DataCell(Text(formatTime(data[index].booking.createdAt))),
      DataCell(Text(formatTime(data[index].createdAt))),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 10;
}
