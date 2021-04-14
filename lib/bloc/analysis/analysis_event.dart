import 'package:equatable/equatable.dart';

abstract class AnalysisEvent extends Equatable {}

class GetBrokerData extends AnalysisEvent {
  int brokerId;
  GetBrokerData({this.brokerId});
  @override
  List<Object> get props => [];
}

// class GetBrokerSellList extends AnalysisEvent {
//   @override
//   List<Object> get props => [];
// }

class GetCompanyData extends AnalysisEvent {
  int companyId;
  GetCompanyData({this.companyId});
  @override
  List<Object> get props => [];
}

// class GetCompanySellList extends AnalysisEvent {
//   @override
//   List<Object> get props => [];
// }
