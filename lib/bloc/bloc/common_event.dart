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

class FetchPaginatedItems extends CommonEvent {}
