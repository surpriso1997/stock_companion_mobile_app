part of 'index_graph_bloc.dart';

abstract class IndexGraphState extends Equatable {
  const IndexGraphState();

  @override
  List<Object> get props => [];
}

class IndexGraphInitial extends IndexGraphState {}

class FetchingGraph extends IndexGraphState {}

class FetchedGraph extends IndexGraphState {
  final List<List<num>> data;
  const FetchedGraph({required this.data});
}

class CandleGraphState extends IndexGraphState {
  final data;
  const CandleGraphState({required this.data});
}

class ErrorState extends IndexGraphState {
  final message;
  const ErrorState({required this.message});
}
