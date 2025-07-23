import 'package:flutter/material.dart';

class AppColors {
// Light Theme Colors

  static const Color lightPrimary = Color.fromARGB(255, 128, 194, 95);
  static const Color lightSecondary = Color(0xFF71C493);

  static const Color lightOnPrimary = Color(0xFFFFFFFF);
  static const Color lightBackground = Color.fromARGB(255, 226, 219, 218);
  static const Color lightOnBackground = Color(0xFF000000);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightOnSurface = Color(0xFF000000);
  static const Color lightError = Color(0xFFB00020);
  static const Color lightOnError = Color(0xFFFFFFFF);

// Dark Theme Colors
  static const Color darkPrimary = Color.fromARGB(255, 72, 153, 196);
  static const Color darkSecondary = Color.fromARGB(255, 108, 215, 153);
  static const Color darkOnPrimary = Color(0xFF000000);
  static const Color darkBackground = Color(0xFF231F20);
  static const Color darkOnBackground = Color(0xFFFFFFFF);
  static const Color darkSurface = Color(0xFF121212);
  static const Color darkOnSurface = Color(0xFFFFFFFF);
  static const Color darkError = Color(0xFFCF6679);
  static const Color darkOnError = Color(0xFF000000);

}

// Light Theme
final ThemeData lightTheme = ThemeData(
  fontFamily: 'OpenSans',
  appBarTheme: const AppBarTheme(centerTitle: true),
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.lightPrimary,
      onPrimary: AppColors.lightOnPrimary,
      background: AppColors.lightBackground,
      onBackground: AppColors.lightOnBackground,
      surface: AppColors.lightSurface,
      onSurface: AppColors.lightOnSurface,
      error: AppColors.lightError,
      onError: AppColors.lightOnError,
      secondary: AppColors.lightSecondary,
      onSecondary: AppColors.lightOnBackground,
      onTertiary: AppColors.lightOnBackground),
);

// Dark Theme
final ThemeData darkTheme = ThemeData(
  fontFamily: 'OpenSans',
  appBarTheme: const AppBarTheme(centerTitle: true),
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.darkPrimary,
      onPrimary: AppColors.darkOnPrimary,
      background: AppColors.darkBackground,
      onBackground: AppColors.darkOnBackground,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkOnSurface,
      error: AppColors.darkError,
      onError: AppColors.darkOnError,
      secondary: AppColors.darkSecondary,
      onSecondary: AppColors.lightOnBackground,
      onTertiary: AppColors.lightOnBackground),
);
