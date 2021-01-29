import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/theme_cubit/theme_cubit.dart';
import 'package:stock_companion/data/repository/company_repo.dart';
import 'package:stock_companion/data/repository/floorsheet_repo.dart';
import 'package:stock_companion/data/repository/market_repository.dart';
import 'package:stock_companion/data/repository/top_trades.dart';

import 'package:stock_companion/services/services.dart';
import 'package:stock_companion/utils/app_config.dart';
import 'pages/pages.dart';
import 'utils/utils.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appconfig = AppConfig.of(context);

    return MultiBlocProviders(
      marketReposity: IMarketReposity(baseUrl: appconfig.baseUrl),
      topTradedRepository: ITopTradesRepo(baseUrl: appconfig.baseUrl),
      floorSheetRepository: IFloorSheetRepo(baseUrl: appconfig.baseUrl),
      companyRepository: ICompanyRepo(baseUrl: appconfig.baseUrl),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          // data: state.theme,
          // isMaterialAppTheme: Platform.isAndroid,
          return MaterialApp(
            // builder: DevicePreview.appBuilder,
            title: AppConfig.of(context).appName,
            theme: state.theme,
            // darkTheme: themeData[AppTheme.Dark],
            home: Homepage(),
            debugShowCheckedModeBanner: AppConfig.of(context).flavor == "dev",
            routes: Routes.routes,
            navigatorKey: Navigation.navigationKey,
          );
        },
      ),
    );
  }
}
