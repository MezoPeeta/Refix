import 'package:dashboard/src/core/navigation/routes.dart';
import 'package:dashboard/src/core/theme/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routes,
      title: 'Refix Dashboard',
      theme: AppTheme.customTheme,
    );
  }
}
