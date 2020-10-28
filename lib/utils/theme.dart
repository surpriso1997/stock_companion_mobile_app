import 'package:flutter/material.dart';

enum AppTheme { Dark, Light, NightBlue, AmoledBlack, DarkGrey }

final primay_color = Color(0xff253559);
final primary_color_dark = Color(0xff253559);
final primary_text_highlight_color = Color(0xffF6B129);
final font_family = "Roboto";

final _baseTheme = ThemeData(
    primaryColor: primay_color,
    buttonTheme: ButtonThemeData(),
    primaryColorDark: primary_color_dark,
    textSelectionColor: primary_text_highlight_color,
    fontFamily: font_family,
    scaffoldBackgroundColor: Colors.black87,
    textTheme: TextTheme(),
    bottomAppBarColor: Colors.black87,
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: Colors.black87));

final themeData = {
  AppTheme.Dark: _baseTheme.copyWith(scaffoldBackgroundColor: Colors.black87),
  AppTheme.Light: _baseTheme.copyWith(
    primaryColorDark: primary_color_dark,
    textSelectionColor: primary_text_highlight_color,
    scaffoldBackgroundColor: Colors.white,
  )
};
