import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'permissions.g.dart';


@riverpod
Future<bool> getLocationPermission(Ref ref) {
  return Permission.location.isGranted;
}

@riverpod
Future<bool> getNotificationPermission(Ref ref) {
  return Permission.notification.isGranted;
}

@riverpod
Future<bool> getSMSPermission(Ref ref) {
  return Permission.sms.isGranted;
}


