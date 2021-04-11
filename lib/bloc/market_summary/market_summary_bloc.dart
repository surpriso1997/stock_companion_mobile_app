import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stock_companion/data/repository/market_repository.dart';
import 'package:stock_companion/models/models.dart';
import 'package:stock_companion/models/nepse_index.dart';
import 'package:stock_companion/utils/utils.dart';

part 'market_summary_state.dart';
part "market_summary_event.dart";

class MarketSummaryCubit extends Bloc<MarketSummaryEvent, MarketSummaryState> {
  MarketSummaryCubit({IMarketReposity marketrepo})
      : _marketRepo = marketrepo,
        super(MIndicesLoading());

  final IMarketReposity _marketRepo;

  Stream<MarketSummaryState> mapEventToState(MarketSummaryEvent event) async* {
    print(event);
    if (event is FetchNepseIndices) {
      yield MIndicesLoading();

      try {
        var res = await _marketRepo.getNepseIndex();
        if (res != null) {
          yield MIndicesFetched(index: res);
        }
      } on ApiException catch (e) {
        yield MIndicesError(error: e.message);
      }
    }
    ////
    else if (event is FetchSubIndices) {
      yield MSubIndicesLoading();
      try {
        var res = await _marketRepo.getSubIndices();
        if (res.isNotEmpty) yield MSubIndicesFetched(subIndices: res);
      } catch (e) {
        MSubIndicesError(error: e.message);
      }
    }
  }
}
