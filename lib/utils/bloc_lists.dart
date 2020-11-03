import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:stock_companion/bloc/market_summary/market_summary_bloc.dart';
import 'package:stock_companion/bloc/theme_cubit/theme_cubit.dart';
import 'package:stock_companion/data/repository/market_repository.dart';

class MultiBlocProviders extends StatelessWidget {
  final Widget child;
  MultiBlocProviders({this.child, @required IMarketReposity marketReposity})
      : _iMarketReposity = marketReposity;

  final IMarketReposity _iMarketReposity;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _iMarketReposity),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeCubit()),
          BlocProvider(
              create: (context) =>
                  MarketSummaryCubit(marketrepo: _iMarketReposity))
        ],
        child: child,
      ),
    );
  }
}
