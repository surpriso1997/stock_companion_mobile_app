import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/data/repository/analysis/company_analysis_repo.dart';

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
      await _repository.getBuyAnalytics(event.companyId);
      await _repository.getBuyAnalytics(event.companyId);

      if (_repository.buy.isNotEmpty) {
        yield FetchedItemsState(items: _repository.buy);
      }
      if (_repository.sell.isEmpty) {
        yield RefreshingItems(items: _repository.sell);
      }
    }
  }
}