part of 'top_trades_bloc.dart';

abstract class TopTradesEvent extends Equatable {
  const TopTradesEvent();

  @override
  List<Object> get props => [];
}

class GetTopItems extends TopTradesEvent {
  final String slug;
  const GetTopItems({@required this.slug});

  @override
  List get props => [slug];
}

class RefreshTopItems extends TopTradesEvent {
  final String slug;
  const RefreshTopItems({@required this.slug});
}
