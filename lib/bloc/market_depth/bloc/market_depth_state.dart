part of 'market_depth_bloc.dart';

abstract class MarketDepthState extends Equatable {
  final MarketDepthData data;
  const MarketDepthState({this.data});

  @override
  List<Object> get props => [];
}

class MarketDepthInitial extends MarketDepthState {}

class MarketDepthLoading extends MarketDepthState {}

class MarketDepthRefreshing extends MarketDepthState {
  final MarketDepthData data;
  const MarketDepthRefreshing({this.data}) : super(data: data);
}

class MarketDepthFetched extends MarketDepthState {
  final MarketDepthData data;
  const MarketDepthFetched({this.data}) : super(data: data);
}

class MarketDepthError extends MarketDepthState {
  final String errorMessage;
  const MarketDepthError({this.errorMessage});
}

class MarketClosedState extends MarketDepthState {}
