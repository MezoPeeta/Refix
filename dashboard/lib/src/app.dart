import 'package:dashboard/src/core/navigation/routes.dart';
import 'package:dashboard/src/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final scaffoldMessengerKeyPod = Provider((ref) {
  return GlobalKey<ScaffoldMessengerState>();
});
final scaffoldMessengerPod = Provider((ref) {
  return ref.watch(scaffoldMessengerKeyPod).currentState!;
});
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
        final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyPod),
      routerConfig: goRouter,
      title: 'Refix Dashboard',
      theme: AppTheme.customTheme,
    );
  }
}
