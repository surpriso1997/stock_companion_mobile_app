part of 'index_graph_bloc.dart';

abstract class IndexGraphEvent extends Equatable {
  const IndexGraphEvent();

  @override
  List<Object> get props => [];
}

class GetGraph extends IndexGraphEvent {
  final int index;

  const GetGraph({this.index});
}

class RefreshGraph extends IndexGraphEvent {
  final int index;

  const RefreshGraph({this.index});
}

class ConvertGraphToCandle extends IndexGraphEvent {
  final int index;

  const ConvertGraphToCandle({this.index});
}
