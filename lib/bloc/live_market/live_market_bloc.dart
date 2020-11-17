import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'live_market_event.dart';
part 'live_market_state.dart';

class LiveMarketBloc extends Bloc<LiveMarketEvent, LiveMarketState> {
  LiveMarketBloc() : super(LiveMarketInitial());

  @override
  Stream<LiveMarketState> mapEventToState(
    LiveMarketEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
