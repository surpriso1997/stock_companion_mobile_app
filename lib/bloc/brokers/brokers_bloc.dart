import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/data/repository/brokers_repo.dart';
import 'package:stock_companion/utils/utils.dart';

class BrokersListBloc extends Bloc<CommonEvent, CommonState> {
  BrokersListBloc({IBrokerRepository repository})
      : _repo = repository,
        super(FetchingItemsState());

  final IBrokerRepository _repo;
  @override
  Stream<CommonState> mapEventToState(
    CommonEvent event,
  ) async* {
    if (event is FetchItems) {
      yield FetchingItemsState();
      try {
        var res = await _repo.getBrokers();
        if (res.isEmpty) {
          yield NoDataState();
        } else if (res.isNotEmpty) {
          yield FetchedItemsState(items: res);
        }
      } on ApiException catch (e) {
        yield ErrorState(message: e.message);
      }
    }

    ///
    else if (state is RefreshErrorState) {
      yield RefreshingItems(items: _repo.brokers);
      try {
        var res = await _repo.getBrokers();
        if (res.isNotEmpty) {
          yield FetchedItemsState(items: res);
        }
      } on ApiException catch (e) {
        yield RefreshErrorState(message: e.message, items: _repo.brokers);
      }
    }
  }
}
