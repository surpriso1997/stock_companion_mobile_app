import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stock_companion/data/repository/market_depth_repo.dart';
import 'package:stock_companion/models/market_depth/market_depth.dart';
import 'package:stock_companion/utils/utils.dart';

part 'market_depth_event.dart';
part 'market_depth_state.dart';

class MarketDepthBloc extends Bloc<MarketDepthEvent, MarketDepthState> {
  MarketDepthBloc(IMarketDepthRepository repository)
      : _repo = repository,
        super(MarketDepthInitial());

  IMarketDepthRepository _repo;

  @override
  Stream<MarketDepthState> mapEventToState(
    MarketDepthEvent event,
  ) async* {
    if (event is GetMarketDepth) {
      // if (state is MarketDepthLoading) {
      //   return;
      // }
      yield MarketDepthLoading();
      try {
        await _repo.getMarketDepth(event.companyId, isRefreshRequest: false);

        if (_repo.marketDepth != null) {
          yield MarketDepthFetched(data: _repo.marketDepth);
        }
      } on MarketClosedException catch (e) {
        yield MarketClosedState();
      } catch (e) {
        yield MarketDepthError(errorMessage: e.toString());
      }
    }

    ///
    else if (event is ResetMarketDepth) {
    }

    ///
    else if (event is RefreshMarketDepth) {
      yield MarketDepthRefreshing(data: _repo.marketDepth);
    }
  }
}
