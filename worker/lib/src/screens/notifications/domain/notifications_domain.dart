import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api.dart';
import '../../auth/data/auth_data.dart';

part 'notifications_domain.g.dart';

@riverpod
class Notifications extends _$Notifications {
  @override
  Future<List<Notification>> build() async {
    final request = await ref
        .read(httpProvider)
        .authenticatedRequest(url: "worker/notification", method: "GET");
    final data = jsonDecode(request.body);
    if (request.statusCode == 200) {
      return data.map<Notification>((e) => Notification.fromJson(e)).toList();
    }

    return [];
  }
}
