import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/theme_cubit/theme_cubit.dart';

import 'package:stock_companion/services/services.dart';
import 'package:stock_companion/utils/app_config.dart';
import 'pages/pages.dart';
import 'utils/utils.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocRepositories(
      child: MultiBlocProviders(
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            // data: state.theme,
            // isMaterialAppTheme: Platform.isAndroid,
            return MaterialApp(
              // builder: DevicePreview.appBuilder,
              title: AppConfig.of(context).appName,
              theme: state.theme,
              darkTheme: themeData[AppTheme.Dark],
              home: Homepage(),
              debugShowCheckedModeBanner: AppConfig.of(context).flavor == "dev",
              routes: Routes.routes,
              navigatorKey: Navigation.navigationKey,
            );
          },
        ),
      ),
    );
  }
}
