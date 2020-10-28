import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:stock_companion/utils/utils.dart';
import '../../utils/utils.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial(theme: themeData[AppTheme.Light]));

  void getInitialTheme() async {}

  void toggleTheme(AppTheme theme) {}

  void setCustomAccentColor(Color color) {}
  void setFontSize(double size) {}
  void setFontFamily(String family) {}
}
