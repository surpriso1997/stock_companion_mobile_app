import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/data/repository/live_market_repo.dart';
import 'package:stock_companion/utils/utils.dart';

class LiveMarketBloc extends Bloc<CommonEvent, CommonState> {
  LiveMarketBloc(ILiveMarketRepository repository)
      : _repo = repository,
        super(FetchingItemsState());

  final ILiveMarketRepository _repo;
  @override
  Stream<CommonState> mapEventToState(
    CommonEvent event,
  ) async* {
    if (event is FetchItems) {
      try {
        // if (_repo.companies.isNotEmpty)
        //   yield FetchedItemsState(items: _repo.companies);
        // else {
        //   yield FetchingItemsState();
        // }

        yield FetchingItemsState();

        var res = await _repo.getLiveData(isRefreshRequest: false);

        if (res.isNotEmpty) {
          yield FetchedItemsState(items: res);
        } else if (res.isEmpty) {
          yield NoDataState();
        }
      } on ApiException catch (e) {
        yield ErrorState(message: e.message);
      }
    }

    ////
    else if (event is FetchMoreItems) {
      try {
        yield FetchingMoreItemsState(items: _repo.liveData);
        await _repo.getLiveData(isRefreshRequest: false, isLoadMore: true);

        yield FetchedItemsState(items: _repo.liveData);
      } on ApiException catch (e) {
        yield FetchedItemsState(items: _repo.liveData);
      }
    } else if (event is FilterItems) {
    } else if (event is RefreshItems) {
      try {
        // if (_repo.companies.isNotEmpty)
        //   yield FetchedItemsState(items: _repo.companies);
        // else {
        //   yield FetchingItemsState();
        // }

        yield RefreshingItems(items: _repo.liveData);

        var res = await _repo.getLiveData(isRefreshRequest: true);

        if (res.isNotEmpty) {
          yield FetchedItemsState(items: res);
        } else if (res.isEmpty) {
          yield FetchedItemsState(items: _repo.liveData);
        }
      } catch (e) {}
    }
  }
}
