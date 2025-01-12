import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'source.freezed.dart';
part 'source.g.dart';

class NotificationDataSource extends DataTableSource {
  final List<Notifications> data;
  final BuildContext context;
  NotificationDataSource(this.data, this.context);

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) return null;
    return DataRow.byIndex(index: index, cells: [
      DataCell(SelectableText(data[index].name)),
      DataCell(SelectableText(data[index].details)),
      const DataCell(Text("")),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 10;
}

@freezed
class Notifications with _$Notifications {
  const factory Notifications(
      {required String name,
      required String details,
      @JsonKey(name: "created_at") required DateTime dateSent}) = _Notifications;

  factory Notifications.fromJson(Map<String, dynamic> json) =>
      _$NotificationsFromJson(json);
}
