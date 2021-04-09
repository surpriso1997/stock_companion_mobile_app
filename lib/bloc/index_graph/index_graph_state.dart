part of 'index_graph_bloc.dart';

abstract class IndexGraphState extends Equatable {
  const IndexGraphState();

  @override
  List<Object> get props => [];
}

class IndexGraphInitial extends IndexGraphState {}

class FetchingGraph extends IndexGraphState {}

class FetchedGraph extends IndexGraphState {
  final data;
  const FetchedGraph({this.data});
}

class CandleGraphState extends IndexGraphState {
  final data;
  const CandleGraphState({this.data});
}

class ErrorState extends IndexGraphState {
  final message;
  const ErrorState({this.message});
}
