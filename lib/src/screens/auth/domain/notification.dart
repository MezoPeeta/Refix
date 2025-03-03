import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:refix/src/core/network/api.dart';
import 'package:refix/src/screens/auth/data/auth_data.dart';
import 'package:refix/src/screens/auth/domain/auth_domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'notification.g.dart';

class FirebaseNotifications {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  init() async {
    if (Platform.isIOS) {
      return;
    }
    // This break on Huawei Devices
    // TODO: DOn't forget this
    await _messaging.requestPermission();
    final token = await getToken();
    log("Token $token");
  }

  Future<String?> getToken() async {
    return _messaging.getToken();
  }
}

@riverpod
Future<void> sendFCMToken(Ref ref) async {
  final fcmToken = await FirebaseNotifications().getToken();
  if (fcmToken != null) {
    final request = await ref.read(httpProvider).authenticatedRequest(
        url: "customer/notification/token",
        method: "PATCH",
        body: {"token": fcmToken.toString()});
    log("Request: ${request.statusCode}");
  }
}

@riverpod
Future markNotificationRead(Ref ref) async {}

@riverpod
class Notifications extends _$Notifications {
  @override
  Future<List<Notification>> build() async {
    final request = await ref
        .read(httpProvider)
        .authenticatedRequest(url: "customer/notification", method: "GET");
    final data = jsonDecode(request.body);
    if (request.statusCode == 200) {
      if (data == null) {
        return [];
      }
      return data.map<Notification>((e) => Notification.fromJson(e)).toList();
    }

    return [];
  }
}
