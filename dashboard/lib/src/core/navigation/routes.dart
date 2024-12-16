import 'package:dashboard/src/screens/base/base.dart';
import 'package:dashboard/src/screens/content/onetime_edit.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => const BaseScreen(), routes: [
    GoRoute(
        name: "onetime_edit",
        path: "onetime/edit/:id",
        builder: (context, state) => const OnetimeEditScreen()),
  ]),
]);
