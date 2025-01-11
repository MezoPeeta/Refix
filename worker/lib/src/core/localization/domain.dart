import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../cache/helper.dart';

extension TranslationExtension on BuildContext {
  AppLocalizations get tr => AppLocalizations.of(this)!;
}

class TranslationRepo {
  static List<Locale> supportedLocales = [
    const Locale('en'),
    const Locale('ar'),
  ];

  static AppLocalizations? translate(context) => AppLocalizations.of(context);
}

final localeNotifierProvider = StateNotifierProvider<LocaleNotifier, Locale>(
    (ref) => LocaleNotifier(const Locale('en')));

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier(Locale state) : super(_initializeLocale());

  static Locale _initializeLocale() {
    String langCode = CacheHelper.getString('locale') ?? 'en';
    return Locale(langCode);
  }

  setLocale(Locale locale) {
    state = locale;
    CacheHelper.setString('locale', locale.languageCode);
  }

  void clearLocale() => state = const Locale('en');
}
