import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warsha2/core/utils/colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.lightBackgroundColor,
  colorScheme: const ColorScheme.light(
    surface: AppColors.lightBackgroundColor,
    primary: AppColors.lightBorderColor,
    secondary: AppColors.lightSecondaryTextColor,
    onSurface: AppColors.lightPrimaryTextColor,
  ),
  textTheme: GoogleFonts.robotoTextTheme().apply(
    displayColor: AppColors.lightPrimaryTextColor,
    bodyColor: AppColors.lightPrimaryTextColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: const OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.blue, width: 2.0),
      borderRadius: BorderRadius.circular(12),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide:
          const BorderSide(color: AppColors.lightBorderColor, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    labelStyle: const TextStyle(color: AppColors.lightPrimaryTextColor),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.errorColor),
    ),
    errorStyle: const TextStyle(color: AppColors.errorColor),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.errorColor),
    ),
  ),
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.darkBackgroundColor,
  colorScheme: const ColorScheme.dark(
    surface: AppColors.darkBackgroundColor,
    primary: AppColors.darkBorderColor,
    secondary: AppColors.darkSecondaryTextColor,
    onSurface: AppColors.darkPrimaryTextColor,
  ),
  textTheme: GoogleFonts.robotoTextTheme().apply(
    displayColor: AppColors.darkPrimaryTextColor,
    bodyColor: AppColors.darkPrimaryTextColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: const OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.blue, width: 2.0),
      borderRadius: BorderRadius.circular(12),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide:
          const BorderSide(color: AppColors.darkBorderColor, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    labelStyle: const TextStyle(color: AppColors.darkPrimaryTextColor),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.errorColor),
    ),
    errorStyle: const TextStyle(color: AppColors.errorColor),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.errorColor),
    ),
  ),
);
