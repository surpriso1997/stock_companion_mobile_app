import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/data/repository/top_trades.dart';
import 'package:stock_companion/utils/utils.dart';

class TransactionsBloc extends Bloc<CommonEvent, CommonState> {
  TransactionsBloc({ITopTradesRepo repository})
      : _repo = repository,
        super(FetchingItemsState());
  final ITopTradesRepo _repo;
  @override
  Stream<CommonState> mapEventToState(
    CommonEvent event,
  ) async* {
    if (event is FetchItems) {
      if (_repo.transactions.isNotEmpty) {
        yield FetchedItemsState(items: _repo.transactions);
      } else
        yield FetchingItemsState();

      try {
        var res = await _repo.getTopTransactions(
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
      yield RefreshingItems(items: _repo.transactions);
      try {
        var res = await _repo.getTopTransactions(isRefreshRequest: true);
        if (res.isNotEmpty) {
          yield FetchedItemsState(items: res);
        }
      } on ApiException catch (e) {
        yield RefreshErrorState(message: e.message, items: _repo.transactions);
      }
    }
  }
}
