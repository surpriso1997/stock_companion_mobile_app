import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/data/repository/stock_price_repo.dart';
import 'package:stock_companion/utils/utils.dart';

class StockPriceBloc extends Bloc<CommonEvent, CommonState> {
  StockPriceBloc({IStockPriceRepo repository})
      : _repo = repository,
        super(FetchingItemsState());

  IStockPriceRepo _repo;
  @override
  Stream<CommonState> mapEventToState(CommonEvent event) async* {
    if (event is FetchItems) {
      try {
        // if (_repo.companies.isNotEmpty)
        //   yield FetchedItemsState(items: _repo.companies);
        // else {
        //   yield FetchingItemsState();
        // }

        yield FetchingItemsState();

        var res = await _repo.getCompanies(isRefreshRequest: false);

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
        yield FetchingMoreItemsState(items: _repo.companies);
        await _repo.getCompanies(isRefreshRequest: false, isLoadMore: true);

        yield FetchedItemsState(items: _repo.companies);
      } on ApiException catch (e) {
        yield FetchedItemsState(items: _repo.companies);
      }
    } else if (event is FilterItems) {}
  }
}
