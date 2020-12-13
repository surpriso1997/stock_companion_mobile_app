import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:stock_companion/bloc/floorsheet/floorsheet_bloc.dart';
import 'package:stock_companion/bloc/market_summary/market_summary_bloc.dart';
import 'package:stock_companion/bloc/theme_cubit/theme_cubit.dart';
import 'package:stock_companion/bloc/top_trades/top_trades_blocs.dart';
import 'package:stock_companion/data/repository/floorsheet_repo.dart';
import 'package:stock_companion/data/repository/market_repository.dart';
import 'package:stock_companion/data/repository/top_trades.dart';

class MultiBlocProviders extends StatelessWidget {
  final Widget child;
  MultiBlocProviders(
      {this.child,
      @required IMarketReposity marketReposity,
      @required ITopTradesRepo topTradedRepository,
      @required IFloorSheetRepo floorSheetRepository})
      : _iMarketReposity = marketReposity,
        _iTopTradesRepo = topTradedRepository,
        _iFloorSheetBloc = floorSheetRepository;

  final IMarketReposity _iMarketReposity;
  final ITopTradesRepo _iTopTradesRepo;
  final IFloorSheetRepo _iFloorSheetBloc;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _iMarketReposity),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider(
              create: (context) => GainersBloc(repository: _iTopTradesRepo)),
          BlocProvider(
              create: (context) => BrokersBloc(repository: _iTopTradesRepo)),
          BlocProvider(
              create: (context) => LosersBloc(repository: _iTopTradesRepo)),
          BlocProvider(
              create: (context) =>
                  TransactionsBloc(repository: _iTopTradesRepo)),
          BlocProvider(
              create: (context) =>
                  SharesTradedBloc(repository: _iTopTradesRepo)),
          BlocProvider(
              create: (context) => TurnoverBloc(repository: _iTopTradesRepo)),
          BlocProvider(
              create: (context) => BrokersBloc(repository: _iTopTradesRepo)),
          BlocProvider(
              create: (context) =>
                  MarketSummaryCubit(marketrepo: _iMarketReposity)),
          BlocProvider(
              create: (context) =>
                  FloorsheetBloc(repository: _iFloorSheetBloc)),
        ],
        child: child,
      ),
    );
  }
}
