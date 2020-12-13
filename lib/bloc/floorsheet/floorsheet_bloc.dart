import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';

class FloorsheetBloc extends Bloc<CommonEvent, CommonState> {
  FloorsheetBloc() : super(FetchingItemsState());

  @override
  Stream<CommonState> mapEventToState(
    CommonEvent event,
  ) async* {}
}
