import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/data/repository/company_repo.dart';
import 'package:stock_companion/utils/utils.dart';

class CompanyBloc extends Bloc<CommonEvent, CommonState> {
  ICompanyRepo _companyRepo;

  CompanyBloc({ICompanyRepo repository})
      : _companyRepo = repository,
        super(FetchingItemsState());

  @override
  Stream<CommonState> mapEventToState(
    CommonEvent event,
  ) async* {
    if (event is FetchItems) {
      if (_companyRepo.companies.isNotEmpty) {
        yield FetchedItemsState(items: _companyRepo.companies);
      } else {
        yield FetchingItemsState();
      }

      try {
        var res = await _companyRepo.getCompanies(
            isRefreshRequest: event.isRefreshRequest);
        if (res.isEmpty) {
          yield NoDataState();
        } else if (res.isNotEmpty) {
          yield FetchedItemsState(items: res);
        }
      } on ApiException catch (e) {
        yield ErrorState(message: e.message);
      }
    } else if (event is RefreshItems) {
    } else if (event is FetchMoreItems) {
    } else if (event is FilterItems) {}
  }
}
