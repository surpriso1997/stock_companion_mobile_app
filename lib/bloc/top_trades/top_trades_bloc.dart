import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:stock_companion/data/repository/top_trades.dart';
import 'package:stock_companion/models/top_trades.dart';
import 'package:stock_companion/utils/custom_exceptions.dart';
part 'top_trades_event.dart';
part 'top_trades_state.dart';

class TopTradesBloc extends Bloc<TopTradesEvent, TopTradesState> {
  TopTradesBloc({ITopTradesRepo topTradesRepo})
      : _topTradesRepo = topTradesRepo,
        super(TopTradesLoading());
  final ITopTradesRepo _topTradesRepo;

  @override
  Stream<TopTradesState> mapEventToState(
    TopTradesEvent event,
  ) async* {
    if (state is GetTopItems) {
      var slug = event.props;

      yield TopTradesLoading();

      try {
        var res = await _topTradesRepo.getTopGainers();

        if (res.isNotEmpty) {
          yield TopTradesFetched(topItems: res);
        }
      } on ApiException catch (e) {
        yield TopTradesError(message: e.toString());
      }
      try {
        _topTradesRepo.getTopGainers();
      } catch (e) {}
    } else if (state is RefreshTopItems) {}
  }
}
