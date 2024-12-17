import 'package:dashboard/src/screens/base/base.dart';
import 'package:dashboard/src/screens/content/onetime_edit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../screens/auth/presentation/login.dart';
import '../storage/storage.dart';

final routes = GoRouter(
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
      GoRoute(path: "/login", builder: (context, state) => const LoginScreen()),
    ]);
