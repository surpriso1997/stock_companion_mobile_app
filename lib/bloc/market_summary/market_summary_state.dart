part of 'market_summary_bloc.dart';

abstract class MarketSummaryState extends Equatable {
  const MarketSummaryState();

  @override
  List<Object> get props => [];
}

class MIndicesLoading extends MarketSummaryState {}

class MSubIndicesLoading extends MarketSummaryState {}

class MIndicesFetched extends MarketSummaryState {
  final List<NepseIndex> index;
  const MIndicesFetched({required this.index});
}

class MSubIndicesFetched extends MarketSummaryState {
  final List<SubIndex> subIndices;
  const MSubIndicesFetched({required this.subIndices});
}

class MIndicesError extends MarketSummaryState {
  final String error;
  const MIndicesError({required this.error});
}

class MSubIndicesError extends MarketSummaryState {
  final String error;
  const MSubIndicesError({required this.error});
}
