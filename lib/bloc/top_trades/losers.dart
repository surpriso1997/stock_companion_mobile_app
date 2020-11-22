import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/data/repository/top_trades.dart';

class LosersBloc extends Bloc<CommonEvent, CommonState> {
  LosersBloc({ITopTradesRepo repository})
      : _repo = repository,
        super(FetchingItemsState());
  final ITopTradesRepo _repo;
  @override
  Stream<CommonState> mapEventToState(
    CommonEvent event,
  ) async* {}
}
