import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:stock_companion/bloc/analysis/broker_analysis_bloc.dart';
import 'package:stock_companion/bloc/analysis/company_analysis_bloc.dart';
import 'package:stock_companion/bloc/brokers/brokers_bloc.dart';
import 'package:stock_companion/bloc/company/company_bloc.dart';
import 'package:stock_companion/bloc/floorsheet/floorsheet_bloc.dart';
import 'package:stock_companion/bloc/index_graph/company_graph.dart';
import 'package:stock_companion/bloc/index_graph/index_graph_bloc.dart';
import 'package:stock_companion/bloc/live_market/live_market_bloc.dart';
import 'package:stock_companion/bloc/market_depth/bloc/market_depth_bloc.dart';
import 'package:stock_companion/bloc/market_details/market_details.bloc.dart';
import 'package:stock_companion/bloc/market_summary/market_indices.bloc.dart';
import 'package:stock_companion/bloc/market_summary/market_subindices.bloc.dart';
import 'package:stock_companion/bloc/market_summary/market_summary_bloc.dart';
import 'package:stock_companion/bloc/news_cubit/news_cubit.dart';
import 'package:stock_companion/bloc/stock_price/stock_price.dart';
import 'package:stock_companion/bloc/theme_cubit/theme_cubit.dart';
import 'package:stock_companion/bloc/top_trades/top_trades_blocs.dart';
import 'package:stock_companion/data/repository/analysis/broker_analysis_repo.dart';
import 'package:stock_companion/data/repository/analysis/company_analysis_repo.dart';
import 'package:stock_companion/data/repository/news_repository.dart';
import '../data/repository/repository.dart';

import 'package:stock_companion/utils/utils.dart';

class MultiBlocProviders extends StatelessWidget {
  final Widget child;

  MultiBlocProviders({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var appconfig = AppConfig.of(context);

    final IMarketReposity _iMarketReposity =
        IMarketReposity(baseUrl: appconfig.baseUrl);
    final ITopTradesRepo _iTopTradesRepo =
        ITopTradesRepo(baseUrl: appconfig.baseUrl);
    final IFloorSheetRepo _iFloorSheetBloc =
        IFloorSheetRepo(baseUrl: appconfig.baseUrl);
    final ICompanyRepo _iCompanyRepository =
        ICompanyRepo(baseUrl: appconfig.baseUrl);
    final IStockPriceRepo _iStockPriceRepository =
        IStockPriceRepo(baseUrl: appconfig.baseUrl);

    final ILiveMarketRepository _iLiveMarketRepository =
        ILiveMarketRepository(baseUrl: appconfig.baseUrl);
    final IMarketDepthRepository _iMarketDepthRepository =
        IMarketDepthRepository(appconfig.baseUrl);

    final IBrokerRepository _iBrokerRepository =
        IBrokerRepository(baseUrl: appconfig.baseUrl);

    final _indexGraphRepository =
        IIndexGraphRepository(baseUrl: appconfig.baseUrl);

    final _imarketRepository = IMarketReposity(baseUrl: appconfig.baseUrl);
    final _iMarketSummaryRepository =
        IMarketSummaryRepository(baseUrl: appconfig.baseUrl);

    final _iCompAnyAnalysisRepository = ICompanyAnalysisRepository();

    final _iBrokerAnalysisRepository = IBrokerAnalysisRepository();
    final _newsRepository = INewsRepoesitory();

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
          BlocProvider(
              create: (context) => LiveMarketBloc(_iLiveMarketRepository)),
          BlocProvider(
              create: (context) => MarketDepthBloc(_iMarketDepthRepository)),
          BlocProvider(
              create: (context) =>
                  BrokersListBloc(repository: _iBrokerRepository)),
          BlocProvider(
              create: (context) => IndexGraphBloc(_indexGraphRepository)),
          BlocProvider(
              create: (context) =>
                  MarketIndicesBloc(repository: _imarketRepository)),
          BlocProvider(
              create: (context) =>
                  MarketSubIndicesBloc(repository: _imarketRepository)),
          BlocProvider(
              create: (context) =>
                  MarketDetailsBloc(repository: _iMarketSummaryRepository)),
          BlocProvider(
              create: (context) =>
                  BrokerAnalysisBloc(repository: _iBrokerAnalysisRepository)),
          BlocProvider(
              create: (context) =>
                  CompanyAnalysisBloc(repository: _iCompAnyAnalysisRepository)),
          BlocProvider(create: (context) => CompanyGraphBloc()),
          BlocProvider(
            create: (context) => NewsBloc(repository: _newsRepository),
          ),
        ],
        child: child,
      ),
    );
  }
}
