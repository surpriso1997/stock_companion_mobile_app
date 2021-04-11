import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/data/repository/market_summary_repo.dart';

class MarketDetailsBloc extends Bloc<CommonEvent, CommonState> {
  MarketDetailsBloc({IMarketSummaryRepository repository})
      : _repo = repository,
        super(FetchingItemsState());

  final IMarketSummaryRepository _repo;

  @override
  Stream<CommonState> mapEventToState(CommonEvent event) async* {
    if (event is FetchItems) {
      yield FetchingItemsState();

      try {
        await _repo.getMarketSummary();

        if (_repo.summary.isNotEmpty) {
          yield FetchedItemsState(items: _repo.summary);
        }
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    }
    //
    else if (event is RefreshItems) {
      yield RefreshingItems(items: _repo.summary);

      try {
        await _repo.getMarketSummary();

        if (_repo.summary.isNotEmpty) {
          yield FetchedItemsState(items: _repo.summary);
        }
      } catch (e) {
        // yield ErrorState(message: e.toString());
      }
    }
  }
}
