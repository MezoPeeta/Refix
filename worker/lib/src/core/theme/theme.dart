import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'radii.dart';

class AppTheme {
  static ThemeData customTheme = ThemeData(
      useMaterial3: true,
      
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              foregroundColor: const WidgetStatePropertyAll(AppColors.white),
              overlayColor: const WidgetStatePropertyAll(AppColors.white),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadii.lg))))),
      bottomSheetTheme: const BottomSheetThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppRadii.x1),
        topRight: Radius.circular(AppRadii.x1),
      ))),
      appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.black,
          elevation: 0.0),
      inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColors.neutral50,
          filled: true,
          contentPadding: const EdgeInsets.all(AppSpacing.x),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(AppRadii.lg)),
          hintStyle: const TextStyle(
              color: AppColors.neutralRefix, fontSize: AppTextSize.two)),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
              foregroundColor: const WidgetStatePropertyAll(AppColors.black),
              backgroundColor: const WidgetStatePropertyAll(AppColors.white),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))))),
      scaffoldBackgroundColor: AppColors.neutral50,
      primaryColor: AppColors.primaryRefix,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              foregroundColor: const WidgetStatePropertyAll(AppColors.white),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadii.lg))),
              textStyle: WidgetStatePropertyAll(TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: AppTextSize.three.toDouble())),
              elevation: const WidgetStatePropertyAll(0),
              backgroundColor:
                  const WidgetStatePropertyAll(AppColors.secondaryRefix))),
      fontFamily:
          GoogleFonts.alexandria(height: 18, fontWeight: FontWeight.w300)
              .fontFamily,
      searchBarTheme: SearchBarThemeData(
          hintStyle: WidgetStatePropertyAll(
              TextStyle(fontSize: AppTextSize.one.toDouble())),
          backgroundColor: const WidgetStatePropertyAll(AppColors.neutral50),
          elevation: const WidgetStatePropertyAll(0.0),
          textStyle: WidgetStatePropertyAll(TextStyle(
              fontSize: AppTextSize.one.toDouble(),
              fontWeight: FontWeight.w300,
              color: AppColors.neutralRefix)),
          shape:
              WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadii.md)))),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.primaryRefix,
          unselectedItemColor: AppColors.neutral400,
          backgroundColor: AppColors.white,
          selectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          )));
}
