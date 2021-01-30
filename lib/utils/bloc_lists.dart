import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:stock_companion/bloc/company/company_bloc.dart';
import 'package:stock_companion/bloc/floorsheet/floorsheet_bloc.dart';
import 'package:stock_companion/bloc/market_summary/market_summary_bloc.dart';
import 'package:stock_companion/bloc/stock_price/stock_price.dart';
import 'package:stock_companion/bloc/theme_cubit/theme_cubit.dart';
import 'package:stock_companion/bloc/top_trades/top_trades_blocs.dart';
import 'package:stock_companion/data/repository/company_repo.dart';
import 'package:stock_companion/data/repository/floorsheet_repo.dart';
import 'package:stock_companion/data/repository/market_repository.dart';
import 'package:stock_companion/data/repository/stock_price_repo.dart';
import 'package:stock_companion/data/repository/top_trades.dart';

class MultiBlocProviders extends StatelessWidget {
  final Widget child;

  MultiBlocProviders({
    this.child,
    @required IMarketReposity marketReposity,
    @required ITopTradesRepo topTradedRepository,
    @required IFloorSheetRepo floorSheetRepository,
    @required ICompanyRepo companyRepository,
    @required IStockPriceRepo stockPriceRepository,
  })  : _iMarketReposity = marketReposity,
        _iTopTradesRepo = topTradedRepository,
        _iFloorSheetBloc = floorSheetRepository,
        _iCompanyRepository = companyRepository,
        _iStockPriceRepository = stockPriceRepository;

  final IMarketReposity _iMarketReposity;
  final ITopTradesRepo _iTopTradesRepo;
  final IFloorSheetRepo _iFloorSheetBloc;
  final ICompanyRepo _iCompanyRepository;
  final IStockPriceRepo _iStockPriceRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _iMarketReposity),
        RepositoryProvider.value(value: _iCompanyRepository),
        RepositoryProvider.value(value: _iTopTradesRepo),
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
          BlocProvider(
              create: (context) =>
                  CompanyBloc(repository: _iCompanyRepository)),
          BlocProvider(
              create: (context) =>
                  StockPriceBloc(repository: _iStockPriceRepository)),
        ],
        child: child,
      ),
    );
  }
}
