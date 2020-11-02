import 'package:flutter/material.dart';

enum AppTheme { Dark, Light, NightBlue, AmoledBlack, DarkGrey }

final primary_color = Color(0xff0D023B);
final primary_color_dark = Color(0xff253559);
final primary_text_highlight_color = Color(0xffF6B129);
final font_family = "Roboto";

final whiteC = Colors.white;
final blackC = Colors.black;
final greenC = Colors.green;
final selectionC = primary_text_highlight_color;

final _baseTextStyle = TextStyle(fontFamily: font_family, color: Colors.white);

final symmetricHzPadding = 10.0;

final _baseTheme = ThemeData(
  primaryColor: primary_color,
  primaryColorLight: primary_color,
  backgroundColor: Colors.white,
  buttonTheme: ButtonThemeData(),
  primaryColorDark: primary_color_dark,
  textSelectionColor: primary_text_highlight_color,
  fontFamily: font_family,
  scaffoldBackgroundColor: Colors.black87,
  dataTableTheme: DataTableThemeData(
    headingRowColor:
        MaterialStateProperty.resolveWith((states) => primary_color),
    headingTextStyle: _baseTextStyle.copyWith(
      fontWeight: FontWeight.bold,
      color: primary_text_highlight_color,
      fontSize: 16,
    ),
    dataTextStyle: _baseTextStyle.copyWith(fontSize: 16),
  ),
  textTheme: TextTheme(
    headline1: _baseTextStyle.copyWith(),
    headline2: _baseTextStyle.copyWith(),
    headline3: _baseTextStyle.copyWith(),
    headline4: _baseTextStyle.copyWith(),
    headline5: _baseTextStyle.copyWith(),
    headline6: _baseTextStyle.copyWith(),
    bodyText1: _baseTextStyle.copyWith(),
    bodyText2: _baseTextStyle.copyWith(),
    button: _baseTextStyle.copyWith(),
    subtitle1: _baseTextStyle.copyWith(),
    subtitle2: _baseTextStyle.copyWith(),
  ),
  bottomAppBarColor: Colors.black87,
  bottomNavigationBarTheme:
      BottomNavigationBarThemeData(backgroundColor: Colors.black87),
);

final themeData = {
  AppTheme.Dark: _baseTheme.copyWith(
    scaffoldBackgroundColor: Colors.black87,
    cardTheme: CardTheme(),
  ),
  AppTheme.Light: _baseTheme.copyWith(
      primaryColorDark: primary_color_dark,
      backgroundColor: Colors.black,
      textSelectionColor: primary_text_highlight_color,
      scaffoldBackgroundColor: Colors.white,
      cardTheme: CardTheme())
};
