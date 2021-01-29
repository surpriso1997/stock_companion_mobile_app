import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/data/repository/floorsheet_repo.dart';
import 'package:stock_companion/utils/custom_exceptions.dart';
import 'floorsheet_state.dart';

class FloorsheetBloc extends Bloc<CommonEvent, FloorsheetState> {
  FloorsheetBloc({@required IFloorSheetRepo repository})
      : _repo = repository,
        super(FetchingItemsState());

  final IFloorSheetRepo _repo;

  @override
  Stream<FloorsheetState> mapEventToState(
    CommonEvent event,
  ) async* {
    if (event is FetchItems) {
      try {
        yield FetchingItemsState();
        var res = await _repo.getFloorSheetData(isRefreshRequest: false);

        if (res.isNotEmpty) {
          yield FetchedItemsState(items: res);
        } else if (res.isEmpty) {
          yield NoDataState();
        }
      } on ApiException catch (e) {
        yield ErrorState(message: e.message);
      }
    } else if (event is FetchMoreItems) {
      try {
        yield RefreshingItems(items: _repo.floorSheetList);
        await _repo.getFloorSheetData(
          isRefreshRequest: false,
          isLoadMore: true,
        );

        yield FetchedItemsState(items: _repo.floorSheetList);
      } on ApiException catch (e) {
        yield FetchedItemsState(items: _repo.floorSheetList);
      }
    } else if (event is FilterItems) {}
  }
}
