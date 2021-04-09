import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stock_companion/data/repository/index_graph_repository.dart';

part 'index_graph_event.dart';
part 'index_graph_state.dart';

class IndexGraphBloc extends Bloc<IndexGraphEvent, IndexGraphState> {
  IndexGraphBloc(IIndexGraphRepository repository)
      : _repo = repository,
        super(IndexGraphInitial());

  final IIndexGraphRepository _repo;

  @override
  Stream<IndexGraphState> mapEventToState(
    IndexGraphEvent event,
  ) async* {
    if (event is GetGraph) {
      try {
        await _repo.getIndexChartData();

        if (_repo.chartData != null) {
          yield FetchedGraph(data: _repo.chartData);
        }
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    }

    ///
    else if (event is RefreshGraph) {
    }

    ///
    else if (event is ConvertGraphToCandle) {}
  }
}
