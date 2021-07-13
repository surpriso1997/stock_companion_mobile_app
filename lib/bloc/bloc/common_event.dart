import 'package:equatable/equatable.dart';

abstract class CommonEvent extends Equatable {
  final bool isRefreshRequst;
  const CommonEvent({required this.isRefreshRequst = false});

  @override
  List<Object> get props => [];
}

class FetchItems extends CommonEvent {
  final bool isRefreshRequest;
  const FetchItems({required this.isRefreshRequest})
      : super(isRefreshRequst: isRefreshRequest);
}

class RefreshItems extends CommonEvent {}

class DeleteItems extends CommonEvent {}

class FetchMoreItems<T> extends CommonEvent {
  final List<T> items;
  const FetchMoreItems({required this.items});
}

class FilterItems<T> extends CommonEvent {
  final Map<String, dynamic> filters;
  const FilterItems({required this.filters});
}

class FetchGraph<T> extends CommonEvent {
  final int id;
  const FetchGraph({required this.id});
}
