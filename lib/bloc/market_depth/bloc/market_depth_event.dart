part of 'market_depth_bloc.dart';

abstract class MarketDepthEvent extends Equatable {
  const MarketDepthEvent();

  @override
  List<Object> get props => [];
}

class GetMarketDepth extends MarketDepthEvent {
  final int companyId;
  const GetMarketDepth(required this.companyId);
}

class ResetMarketDepth extends MarketDepthEvent {}

class RefreshMarketDepth extends MarketDepthEvent {
  final int companyId;
  const RefreshMarketDepth(required this.companyId);
}
