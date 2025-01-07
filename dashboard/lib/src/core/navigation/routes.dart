import 'package:dashboard/src/screens/auth/data/auth_data.dart';
import 'package:dashboard/src/screens/base/base.dart';
import 'package:dashboard/src/screens/booking/data/booking.dart';
import 'package:dashboard/src/screens/users/tasks.dart';
import 'package:dashboard/src/screens/users/users_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../screens/auth/presentation/login.dart';
import '../../screens/discount/data/discount_data.dart';
import '../../screens/discount/presentation/discount_edit.dart';
import '../../screens/permission/add_edit_user.dart';
import '../../screens/rules/presentation/rules_edit.dart';
import '../../screens/services/services_edit.dart';
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
            path: "/tasks", builder: (context, state) => const TasksScreen()),
        GoRoute(
            path: "/worker/edit",
            builder: (context, state) => AddEditWorker(
                  worker: state.extra as Worker?,
                )),
        GoRoute(
            path: "/user/edit",
            builder: (context, state) => AddEditUser(
                  user: state.extra as User?,
                )),
        GoRoute(
            path: "/discount/edit",
            builder: (context, state) => DiscountEdit(
                  discount: state.extra as Discount,
                )),
        GoRoute(
            path: "/permission/edit",
            builder: (context, state) => AddEditPermission(
                  user: state.extra as User?,
                )),
        GoRoute(
            path: "/rule/edit",
            builder: (context, state) => AddEditRule(
                  role: state.extra as Role?,
                )),
        GoRoute(
            path: "/services/edit",
            builder: (context, state) => AddEditService(
                  service: state.extra as Service?,
                )),
      ]);
});
