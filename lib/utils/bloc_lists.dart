import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:stock_companion/bloc/theme_cubit/theme_cubit.dart';
import 'package:stock_companion/data/repository/market_summary_repository.dart';

class MultiBlocProviders extends StatelessWidget {
  final Widget child;
  const MultiBlocProviders({this.child});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ThemeCubit())],
      child: child,
    );
  }
}

class MultiBlocRepositories extends StatelessWidget {
  final Widget child;
  const MultiBlocRepositories({this.child});
  @override
  Widget build(Object context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider(create: (context) => MarketRepository())
    ], child: child);
  }
}
