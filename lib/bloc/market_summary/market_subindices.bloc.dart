import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/data/repository/market_repository.dart';
import 'package:stock_companion/utils/utils.dart';

class MarketSubIndicesBloc extends Bloc<CommonEvent, CommonState> {
  MarketSubIndicesBloc({IMarketReposity repository})
      : _marketRepo = repository,
        super(FetchingItemsState());
  final IMarketReposity _marketRepo;

  @override
  Stream<CommonState> mapEventToState(CommonEvent event) async* {
    if (event is FetchItems) {
      yield FetchingItemsState();

      try {
        var res = await _marketRepo.getSubIndices();
        if (res != null) {
          yield FetchedItemsState(items: res);
        }
      } on ApiException catch (e) {
        yield ErrorState(message: e.message);
      }
    } else if (event is RefreshItems) {
      try {
        var res = await _marketRepo.getNepseIndex(isRefreshRequest: true);
        if (res != null) {
          yield FetchedItemsState(items: res);
        }
      } on ApiException catch (e) {
        yield ErrorState(message: e.message);
      }
    }
  }
}
