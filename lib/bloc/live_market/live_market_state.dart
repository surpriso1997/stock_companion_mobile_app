part of 'live_market_bloc.dart';

abstract class LiveMarketState extends Equatable {
  const LiveMarketState();
  
  @override
  List<Object> get props => [];
}

class LiveMarketInitial extends LiveMarketState {}
