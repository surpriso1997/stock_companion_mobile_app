part of 'top_trades_bloc.dart';

abstract class TopTradesState extends Equatable {
  const TopTradesState({this.topItems});
  final List<TopItem> topItems;

  @override
  List<Object> get props => [];
}

class TopTradesLoading extends TopTradesState {}

class TopTradesFetched extends TopTradesState {
  final List<TopItem> topItems;

  const TopTradesFetched({@required this.topItems}) : super(topItems: topItems);
}

class TopTradesError extends TopTradesState {
  final String message;
  const TopTradesError({this.message});
}

class TopTradesREfreshing extends TopTradesState {
  final List<TopItem> topItems;

  const TopTradesREfreshing({@required this.topItems})
      : super(topItems: topItems);
}
