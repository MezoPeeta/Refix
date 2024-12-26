import 'package:dashboard/src/screens/auth/data/auth_data.dart';
import 'package:dashboard/src/screens/base/base.dart';
import 'package:dashboard/src/screens/users/tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../screens/auth/presentation/login.dart';
import '../../screens/users/workers_edit.dart';
import '../storage/storage.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      initialLocation: "/login",
      redirect: (BuildContext context, GoRouterState state) async {
        final accessToken = await SecureStorage().read(key: "access_token");
        if (accessToken != null) {
          if (state.uri.toString() == '/login') {
            return '/';
          }
          return null;
        }

        return '/login';
      },
      routes: [
        GoRoute(path: "/", builder: (context, state) => const BaseScreen()),
        GoRoute(
            path: "/login", builder: (context, state) => const LoginScreen()),
        GoRoute(
            path: "/tasks",
            builder: (context, state) => TasksScreen(
                  worker: state.extra as Worker,
                )),
        GoRoute(
            path: "/worker/edit",
            builder: (context, state) => AddEditWorker(
                  worker: state.extra as Worker?,
                )),
      ]);
});
