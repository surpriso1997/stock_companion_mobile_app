import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class CommonState<T> extends Equatable {
  const CommonState({required this.listItems});

  final List<T> listItems;

  @override
  List<T> get props => [];
}

class FetchingItemsState extends CommonState {}

class NoDataState extends CommonState {}

class FetchedItemsState<T> extends CommonState {
  final List<T> items;
  const FetchedItemsState({@required required this.items})
      : super(listItems: items);
}

class RefreshingItems<T> extends CommonState {
  final List<T> items;
  const RefreshingItems({required this.items}) : super(listItems: items);
}

class ErrorState extends CommonState {
  final String message;
  const ErrorState({required this.message});
}

class RefreshErrorState<T> extends CommonState {
  final String message;
  final List<T> items;
  const RefreshErrorState({required this.message, required this.items})
      : super(listItems: items);
}

class DummyState extends CommonState {}

class FetchingMoreItemsState<T> extends CommonState {
  final List<T> items;
  const FetchingMoreItemsState({required this.items}) : super(listItems: items);
}
