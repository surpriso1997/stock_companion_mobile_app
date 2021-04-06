part of 'market_depth_bloc.dart';

abstract class MarketDepthState extends Equatable {
  const MarketDepthState();

  @override
  List<Object> get props => [];
}

class MarketDepthInitial extends MarketDepthState {}

class MarketDepthLoading extends MarketDepthState {}

class MarketDepthRefreshing extends MarketDepthState {
  final MarketDepthData data;
  const MarketDepthRefreshing({this.data});
}

class MarketDepthFetched extends MarketDepthState {
  final MarketDepthData data;
  const MarketDepthFetched({this.data});
}

class MarketDepthError extends MarketDepthState {
  final String errorMessage;
  const MarketDepthError({this.errorMessage});
}
