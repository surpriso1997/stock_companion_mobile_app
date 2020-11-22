import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/data/repository/top_trades.dart';
import 'package:stock_companion/utils/utils.dart';

class BrokersBloc extends Bloc<CommonEvent, CommonState> {
  BrokersBloc({ITopTradesRepo repository})
      : _repo = repository,
        super(FetchingItemsState());

  final ITopTradesRepo _repo;
  @override
  Stream<CommonState> mapEventToState(
    CommonEvent event,
  ) async* {
    if (event is FetchItems) {
      yield FetchingItemsState();

      try {
        var res =
            await _repo.getTopGainers(isRefreshRequest: event.isRefreshRequest);

        if (res.isEmpty) {
          yield NoDataState();
        } else if (res.isNotEmpty) {
          // _gainers.addAll(res);

          yield FetchedItemsState(items: res);
        }
      } on ApiException catch (e) {
        yield ErrorState(message: e.message);
      }
    } else if (state is RefreshErrorState) {
      yield RefreshingItems(items: _repo.gainers);
      try {
        var res = await _repo.getTopGainers();
        if (res.isNotEmpty) {
          yield FetchedItemsState(items: res);
        }
      } on ApiException catch (e) {
        yield RefreshErrorState(message: e.message, items: _repo.gainers);
      }
    }
  }
}
