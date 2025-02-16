import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:worker/src/core/localization/domain.dart';
import 'package:worker/src/core/routes/routes.dart';
import 'package:worker/src/core/theme/theme.dart';

import '../l10n/app_localizations.dart';
import 'core/theme/colors.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.neutral50,
        systemNavigationBarIconBrightness: Brightness.light));

    return MaterialApp.router(
        scaffoldMessengerKey: ref.read(scaffoldMessengerKeyPod),
        routerConfig: ref.watch(goRouterProvider),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          AppLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: ref.watch(localeNotifierProvider),
        supportedLocales: TranslationRepo.supportedLocales,
        theme: AppTheme.customTheme);
  }
}

final scaffoldMessengerKeyPod = Provider((ref) {
  return GlobalKey<ScaffoldMessengerState>();
});

final scaffoldMessengerPod = Provider((ref) {
  return ref.watch(scaffoldMessengerKeyPod).currentState!;
});
