import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/data/repository/top_trades.dart';
import 'package:stock_companion/utils/utils.dart';

class TurnoverBloc extends Bloc<CommonEvent, CommonState> {
  TurnoverBloc({ITopTradesRepo repository})
      : _repo = repository,
        super(FetchingItemsState());
  final ITopTradesRepo _repo;
  @override
  Stream<CommonState> mapEventToState(
    CommonEvent event,
  ) async* {
    if (event is FetchItems) {
      if (_repo.turnovers.isNotEmpty) {
        yield FetchedItemsState(items: _repo.turnovers);
      } else
        yield FetchingItemsState();

      try {
        var res = await _repo.getTopTurnovers(
            isRefreshRequest: event.isRefreshRequest);

        if (res.isEmpty) {
          yield NoDataState();
        } else if (res.isNotEmpty) {
          yield FetchedItemsState(items: res);
        }
      } on ApiException catch (e) {
        yield ErrorState(message: e.message);
      }
    } else if (state is RefreshErrorState) {
      yield RefreshingItems(items: _repo.turnovers);
      try {
        var res = await _repo.getTopTurnovers();
        if (res.isNotEmpty) {
          yield FetchedItemsState(items: res);
        }
      } on ApiException catch (e) {
        yield RefreshErrorState(message: e.message, items: _repo.turnovers);
      }
    }
  }
}
