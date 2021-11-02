import 'package:flutter/material.dart';

import 'shared.dart';

class AppThemeData {
  AppThemeData._();

  static final ThemeData defaultTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    fontFamily: 'Rubik',
    scaffoldBackgroundColor: AppColors.white,
    canvasColor: AppColors.white,
    dividerColor: AppColors.lightGrey,
    appBarTheme: const AppBarTheme(
      color: AppColors.primary,
      titleTextStyle: TextStyle(color: AppColors.black),
      toolbarTextStyle: TextStyle(color: AppColors.black),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: AppColors.lightGrey,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightGrey,
      elevation: 0,
    ),
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.black,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    )
        .apply(
          bodyColor: AppColors.white,
          displayColor: AppColors.greyDark,
        )
        .copyWith(
          caption: const TextStyle(color: AppColors.greyDark),
          bodyText1: const TextStyle(color: AppColors.greyDark),
          button: const TextStyle(color: AppColors.white),
          headline1: const TextStyle(
            color: AppColors.greyDark,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          headline2: const TextStyle(color: AppColors.white),
          headline3: const TextStyle(color: AppColors.greyDark),
        ),
    toggleButtonsTheme: ToggleButtonsThemeData(
      fillColor: AppColors.black,
      borderRadius: BorderRadius.circular(10),
      selectedColor: AppColors.white,
      color: AppColors.black,
      splashColor: AppColors.white.withOpacity(0.5),
      textStyle: const TextStyle(fontSize: 15),
    ),
    primaryIconTheme: const IconThemeData(color: AppColors.greyDark),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      brightness: Brightness.light,
      primary: AppColors.primary,
      primaryVariant: AppColors.lightGrey,
      secondary: AppColors.black,
      secondaryVariant: AppColors.lightGrey,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
    ),
  );
}
