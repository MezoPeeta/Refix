import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:worker/src/screens/auth/signin/signin.dart';
import 'package:worker/src/screens/profile/user_profile.dart';
import 'package:worker/src/screens/tasks/in_task.dart';
import 'package:worker/src/screens/tasks/inspection.dart';
import 'package:worker/src/screens/tasks/on_ward.dart';
import 'package:worker/src/screens/tasks/task_done.dart';

import '../../screens/base/base.dart';
import '../../screens/notifications/notifications.dart';
import '../../screens/tasks/payment.dart';
import '../storage/secure_storage.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return routes;
});

final routes = GoRouter(
    initialLocation: "/",
    redirect: (BuildContext context, GoRouterState state) async {
      final accessToken = await SecureStorage().read(key: "access_token");
      if (accessToken != null) {
        if (state.uri.toString() == '/login') {
          return '/';
        }
        return null;
      }

      return null;
    },
    routes: [
      GoRoute(path: "/login", builder: (context, state) => const LoginScreen()),
      GoRoute(path: "/", builder: (context, state) => const BaseWidget()),
      GoRoute(
          path: "/user/profile",
          builder: (context, state) => const UserProfile()),
      GoRoute(
          path: "/notifications",
          builder: (context, state) => const NotificationsScreen()),
      GoRoute(
          path: "/onward",
          builder: (context, state) => OnWardScreen(
                data: state.extra as Map<String, dynamic>,
              )),
      GoRoute(
          path: "/intasks",
          builder: (context, state) => InTaskScreen(
                data: state.extra as Map<String, dynamic>,
              )),
      GoRoute(
          path: "/payment",
          builder: (context, state) => TaskpaymentScreen(
                data: state.extra as Map<String, dynamic>,
              )),
      GoRoute(
          path: "/inspection",
          builder: (context, state) => InspectionScreen(
                data: state.extra as Map<String, dynamic>,
              )),
      GoRoute(path: "/success", builder: (context, state) => TaskDone()),
    ]);
