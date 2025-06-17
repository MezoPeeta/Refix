import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:refix/l10n/app_localizations.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:refix/src/core/navigation/routes.dart';
import 'package:refix/src/core/ui/theme/colors.dart';
import 'package:refix/src/core/ui/theme/theme.dart';

final scaffoldMessengerKeyPod = Provider((ref) {
  return GlobalKey<ScaffoldMessengerState>();
});

final scaffoldMessengerPod = Provider((ref) {
  return ref.watch(scaffoldMessengerKeyPod).currentState!;
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(systemNavigationBarColor: AppColors.neutral50, systemNavigationBarIconBrightness: Brightness.light));
    return MaterialApp.router(
        scaffoldMessengerKey: ref.read(scaffoldMessengerKeyPod),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: TranslationRepo.supportedLocales,
        routerConfig: ref.watch(goRouterProvider),
        locale: ref.watch(localeNotifierProvider),
        title: 'Refix',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.customTheme);
  }
}
