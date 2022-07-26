import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static const MaterialColor primarycolor =
      MaterialColor(_primarycolorPrimaryValue, <int, Color>{
    50: Color(0xFFFFE0E0),
    100: Color(0xFFFFB3B3),
    200: Color(0xFFFF8080),
    300: Color(0xFFFF4D4D),
    400: Color(0xFFFF2626),
    500: Color(_primarycolorPrimaryValue),
    600: Color(0xFFFF0000),
    700: Color(0xFFFF0000),
    800: Color(0xFFFF0000),
    900: Color(0xFFFF0000),
  });
  static const int _primarycolorPrimaryValue = 0xFFFF0000;
  static ThemeData lightTheme = ThemeData(
    primarySwatch: primarycolor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: true,
      foregroundColor: AppColors.darkRedColor,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.darkRedColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: AppColors.darkRedColor,
        unselectedItemColor: AppColors.greyColor),
  );
}

class AppColors {
  AppColors._();
  static const primaryColor = Color(0xFFFF0000);
  static const darkRedColor = Color(0xFFE50000);
  static const greyColor = Color(0xFFB4B8CA);
  static const greyColor1 = Color(0xFF515151);
  static const shadow = Color(0xFF000000);
}

class AppTextStyle {
  AppTextStyle._();
  static TextStyle regular14({Color? color}) {
    return TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14,
        fontFamily: 'Roboto',
        color: color ?? AppColors.greyColor);
  }

  static TextStyle regular16({Color? color}) {
    return TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 17,
        letterSpacing: 1.5,
        fontFamily: 'Roboto',
        color: color ?? AppColors.greyColor1);
  }

  static TextStyle bold({Color? color}) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 33,
        fontFamily: 'Roboto',
        color: color ?? Colors.black);
  }

  static TextStyle boldSpace({Color? color}) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 33,
        letterSpacing: 2.0,
        fontFamily: 'Roboto',
        color: color ?? Colors.black);
  }

  static TextStyle boldSpaceRed({Color? color}) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 33,
        letterSpacing: 2.0,
        fontFamily: 'Roboto',
        color: color ?? const Color(0xFFFF0000));
  }

  static TextStyle whiteBold({Color? color}) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 33,
        fontFamily: 'Roboto',
        color: color ?? Colors.white);
  }
}
