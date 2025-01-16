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
      DataCell(SelectableText(data[index].id)),
      DataCell(
          SelectableText(data[index].booking.services.first.name?.en ?? "")),
      DataCell(SelectableText(data[index].booking.worker?.username ?? "")),
      DataCell(SelectableText(data[index].booking.customer.username)),
      DataCell(SelectableText("${data[index].rating}" " /5")),
      DataCell(SelectableText(formatTime(data[index].booking.createdAt))),
      DataCell(SelectableText(formatTime(data[index].createdAt))),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 10;
}
