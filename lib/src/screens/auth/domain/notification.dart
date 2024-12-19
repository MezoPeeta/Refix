import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_api_availability/google_api_availability.dart';
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
      await _messaging.requestPermission();
      final token = await getToken();
      log("Token $token");
      return;
    }
    GooglePlayServicesAvailability availability = await GoogleApiAvailability
        .instance
        .checkGooglePlayServicesAvailability();
    log("[Google Play Services] $availability");

    if (availability == GooglePlayServicesAvailability.success) {
      await _messaging.requestPermission();
      final token = await getToken();
      log("Token $token");
    }
  }

  Future<String?> getToken() async {
    return _messaging.getToken();
  }
}

@riverpod
Future<void> sendFCMToken(Ref ref) async {
  final fcmToken = await FirebaseNotifications().getToken();
  await ref.read(httpProvider).authenticatedRequest(
      url: "customer/notification/token",
      method: "PATCH",
      body: {"token": fcmToken});
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
      return data.map((e) => Notification.fromJson(e)).toList();
    }
    if (request.statusCode == 401) {
      ref.read(authProvider).logout();
      return [];
    }
    return [];
  }

  Future<void> markRead() async {
    state = const AsyncValue.loading();
    final request = await ref
        .read(httpProvider)
        .authenticatedRequest(url: "customer/notification", method: "GET");

    if (request.statusCode == 204) {
      final notifications = await ref
          .read(httpProvider)
          .authenticatedRequest(url: "customer/notification", method: "GET");
      final data = jsonDecode(notifications.body);
      final List<Notification> lN =
          data.map<Notification>((e) => Notification.fromJson(e)).toList();
      state = AsyncValue.data(lN);
      return;
    }
    if (request.statusCode == 401) {
      ref.read(authProvider).logout();
    }
  }
}
