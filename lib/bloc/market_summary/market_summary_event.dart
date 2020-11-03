part of 'market_summary_bloc.dart';

abstract class MarketSummaryEvent extends Equatable {}

class FetchNepseIndices extends MarketSummaryEvent {
  @override
  List<Object> get props => [];
}

class FetchSubIndices extends MarketSummaryEvent {
  @override
  List<Object> get props => [];
}

class FetchMarketSummary extends MarketSummaryEvent {
  @override
  List<Object> get props => [];
}

class RefreshNepseIndices extends MarketSummaryEvent {
  @override
  List<Object> get props => [];
}

class RefreshSubIndices extends MarketSummaryEvent {
  @override
  List<Object> get props => [];
}
