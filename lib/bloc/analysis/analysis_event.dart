import 'package:equatable/equatable.dart';

abstract class AnalysisEvent extends Equatable {}

class GetBrokerData extends AnalysisEvent {
  final int brokerId;
  GetBrokerData({required this.brokerId});
  @override
  List<Object> get props => [];
}

// class GetBrokerSellList extends AnalysisEvent {
//   @override
//   List<Object> get props => [];
// }

class GetCompanyData extends AnalysisEvent {
  final String scripSymbol;
  GetCompanyData({required this.scripSymbol});
  @override
  List<Object> get props => [];
}

// class GetCompanySellList extends AnalysisEvent {
//   @override
//   List<Object> get props => [];
// }
