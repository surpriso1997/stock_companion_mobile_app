import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/data/repository/analysis/company_analysis_repo.dart';
import 'package:stock_companion/models/analysis/analysis_model.dart';

import 'analysis_event.dart';

class CompanyAnalysisBloc extends Bloc<AnalysisEvent, CommonState> {
  CompanyAnalysisBloc({ICompanyAnalysisRepository repository})
      : _repository = repository,
        super(FetchingItemsState());
  ICompanyAnalysisRepository _repository;

  @override
  Stream<CommonState> mapEventToState(AnalysisEvent event) async* {
    if (event is GetCompanyData) {
      yield FetchingItemsState();

      try {
        await _repository.getBuyAnalytics(event.scripSymbol);
        await _repository.getSellAnalytics(event.scripSymbol);

        if (_repository.buy.isNotEmpty || _repository.sell.isNotEmpty) {
          yield FetchedItemsState(items: [
            AnalysisModel(
              buy: _repository.buy.isEmpty ? [] : _repository.buy,
              sell: _repository.sell.isEmpty ? [] : _repository.sell,
            )
          ]);
        }
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    }
  }
}
