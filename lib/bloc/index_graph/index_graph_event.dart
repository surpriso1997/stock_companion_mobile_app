part of 'index_graph_bloc.dart';

abstract class IndexGraphEvent extends Equatable {
  const IndexGraphEvent();

  @override
  List<Object> get props => [];
}

class GetGraph extends IndexGraphEvent {
  final int index;
  final String startDate;
  final String endDate;

  const GetGraph(
      {required this.index, required this.startDate, required this.endDate});
}

class RefreshGraph extends IndexGraphEvent {
  final int index;

  const RefreshGraph({required this.index});
}

class ConvertGraphToCandle extends IndexGraphEvent {
  final int index;

  const ConvertGraphToCandle({required this.index});
}
