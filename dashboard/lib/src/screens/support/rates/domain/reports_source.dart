import 'package:dashboard/src/core/theme/colors.dart';
import 'package:dashboard/src/screens/booking/data/booking.dart';
import 'package:dashboard/src/screens/navbar/navbar.dart';
import 'package:dashboard/src/screens/support/report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ReportsDataSource extends DataTableSource {
  WidgetRef ref;
  List<BookingElement> data;
  ReportsDataSource(this.data, this.ref);
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
      DataCell(SelectableText(data[index].services.first.name?.en ?? "")),
      DataCell(SelectableText("${data[index].worker?.username}%")),
      DataCell(SelectableText(data[index].customer.username)),
      DataCell(SelectableText(formatTime(data[index].createdAt))),
      const DataCell(SelectableText("SD")),
      DataCell(SelectableText(
        data[index].resolved ? "Solved" : "UnSolved",
        style: TextStyle(
            color: data[index].resolved ? null : AppColors.primaryRefix),
      )),
      DataCell(TextButton(
        onPressed: () {
          ref.read(reportProvider.notifier).state = data[index];
          ref.read(currentIndexProvider.notifier).state = 17;
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
  int get selectedRowCount => 10;
}
