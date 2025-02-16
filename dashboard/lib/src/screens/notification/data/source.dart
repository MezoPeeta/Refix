import 'dart:convert';
import 'dart:developer';

import 'package:dashboard/src/core/theme/btns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/navigation/api.dart';
part 'source.freezed.dart';
part 'source.g.dart';

class NotificationDataSource extends DataTableSource {
  final List<Notifications> data;
  final BuildContext context;
  final WidgetRef ref;
  NotificationDataSource(this.data, this.context, this.ref);

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) return null;
    return DataRow.byIndex(index: index, cells: [
      DataCell(SelectableText(data[index].title)),
      DataCell(SelectableText(data[index].body ?? "")),
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
  const factory Notifications({
    @JsonKey(name: "_id") required String id,
    required String title,
    @JsonKey(name: "body") String? body,
  }) = _Notifications;

  factory Notifications.fromJson(Map<String, dynamic> json) =>
      _$NotificationsFromJson(json);
}

@riverpod
class NotificationsNotifier extends _$NotificationsNotifier {
  Future<List<Notifications>> getNotifications() async {
    final response = await ref
        .read(httpProvider)
        .authenticatedRequest(url: "notification", method: "GET");
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      debugPrint("Data: $data");
      return data.map<Notifications>((e) => Notifications.fromJson(e)).toList();
    }

    return [];
  }

  @override
  FutureOr<List<Notifications>> build() => getNotifications();

  Future<void> delete({required String id}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final request = await ref
          .read(httpProvider)
          .authenticatedRequest(url: "notification/$id", method: "DELETE");
      return getNotifications();
    });
  }

  Future<void> send({required String title, required String body}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(httpProvider).authenticatedRequest(
          url: "notification/customers",
          method: "POST",
          body: {"title": title, "body": body});
      return getNotifications();
    });
  }
}
