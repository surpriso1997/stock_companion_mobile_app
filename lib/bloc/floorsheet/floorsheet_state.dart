import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:stock_companion/models/models.dart';

abstract class FloorsheetState<T> extends Equatable {
  const FloorsheetState({required this.listItems});

  final List<T> listItems;

  @override
  List<T> get props => [];
}

class FetchingItemsState extends FloorsheetState {}

class NoDataState extends FloorsheetState {}

class FetchedItemsState<T> extends FloorsheetState {
  final List<T> items;
  final TotalInfo totalInfo;
  const FetchedItemsState(
      {@required required this.items, required this.totalInfo})
      : super(listItems: items);
}

class RefreshingItems<T> extends FloorsheetState {
  final List<T> items;
  const RefreshingItems({required this.items}) : super(listItems: items);
}

class ErrorState extends FloorsheetState {
  final String message;
  const ErrorState({required this.message});
}

class RefreshErrorState<T> extends FloorsheetState {
  final String message;
  final List<T> items;
  const RefreshErrorState({required this.message, required this.items})
      : super(listItems: items);
}

class LoadingMoreState extends FloorsheetState {
  final List items;
  final TotalInfo totalInfo;
  const LoadingMoreState(
      {@required required this.items, required this.totalInfo})
      : super(listItems: items);
}
