import 'package:equatable/equatable.dart';

abstract class CommonEvent extends Equatable {
  const CommonEvent();

  @override
  List<Object> get props => [];
}

class FetchItems extends CommonEvent {}

class RefreshItems extends CommonEvent {}

class DeleteItems extends CommonEvent {}

class FetchPaginatedItems extends CommonEvent {}
