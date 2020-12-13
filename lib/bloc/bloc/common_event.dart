import 'package:equatable/equatable.dart';

abstract class CommonEvent extends Equatable {
  final bool isRefreshRequst;
  const CommonEvent({this.isRefreshRequst = false});

  @override
  List<Object> get props => [];
}

class FetchItems extends CommonEvent {
  final bool isRefreshRequest;
  const FetchItems({this.isRefreshRequest})
      : super(isRefreshRequst: isRefreshRequest);
}

class RefreshItems extends CommonEvent {}

class DeleteItems extends CommonEvent {}

class FetchMoreItems<T> extends CommonEvent {
  final List<T> items;
  const FetchMoreItems({this.items});
}

class FilterItems<T> extends CommonEvent {
  final Map<String, dynamic> filters;
  const FilterItems({this.filters});
}
