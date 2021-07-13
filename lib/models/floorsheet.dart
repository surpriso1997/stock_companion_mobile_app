import 'package:stock_companion/models/company_list_model.dart';

class FloorSheetData {
  final PageInfo pageInfo;
  final List<Details> details;

  const FloorSheetData({required this.pageInfo, required this.details});

  factory FloorSheetData.fromJson(Map json) {
    return FloorSheetData(
        details: json['floorsheets']['content']
            .map<Details>((item) => Details.fromJson(item))
            .toList(),
        pageInfo: PageInfo.fromJsons(json['']));
  }
}

class TotalInfo {
  final totalAmount;
  final totalQty;
  final totalTrades;
  const TotalInfo({required this.totalAmount, required this.totalQty, required this.totalTrades});

  factory TotalInfo.fromJson(Map json) {
    return TotalInfo(
      totalAmount: json['totalAmount'],
      totalQty: json['totalQty'],
      totalTrades: json['totalTrades'],
    );
  }
}

class PageInfo {
  final totalPages;
  final totalElements;
  final last;
  final size;
  final number;
  final numberOfElements;
  final sorted;

  const PageInfo({
    required this.totalElements,
    required this.totalPages,
    required this.last,
    required this.size,
    required this.sorted,
    required this.number,
    required this.numberOfElements,
  });

  factory PageInfo.fromJsons(Map json) {
    return PageInfo(
      totalElements: json['totalElements'],
      totalPages: json['totalPages'],
      last: json['last'],
      number: json['number'],
      size: json['size'],
      numberOfElements: json['numberOfElements'],
      sorted: json['sort']['sorted'],
    );
  }
}

class Details {
  final id;
  final contractId;
  final contracyType;
  final stockSymbol;
  final buyerMemberId;
  final sellerMemberId;
  final contractQuantity;
  final contractRate;
  final businessDate;
  final tradeBookId;
  final stockId;
  final buyerBrokerName;
  final sellerBrokerName;
  final securityName;
  final contractAmount;

  const Details({
    required this.id,
    required this.contractId,
    required this.contractQuantity,
    required this.contracyType,
    required this.stockSymbol,
    required this.buyerMemberId,
    required this.sellerMemberId,
    required this.contractRate,
    required this.businessDate,
    required this.tradeBookId,
    required this.stockId,
    required this.buyerBrokerName,
    required this.sellerBrokerName,
    required this.securityName,
    required this.contractAmount,
  });

  factory Details.fromJson(Map json) {
    return Details(
      id: json['id'],
      contractId: json['contractId'],
      contractQuantity: json['contractQuantity'],
      contracyType: json['contracyType'],
      stockSymbol: json['stockSymbol'],
      buyerMemberId: json['buyerMemberId'],
      sellerMemberId: json['sellerMemberId'],
      contractRate: json['contractRate'],
      businessDate: json['businessDate'],
      tradeBookId: json['tradeBookId'],
      stockId: json['stockId'],
      buyerBrokerName: json['buyerBrokerName'],
      sellerBrokerName: json['sellerBrokerName'],
      securityName: json['securityName'],
      contractAmount: json['contractAmount'],
    );
  }

  CompanyListModel get toCompany {
    return CompanyListModel(
      id: required this.id,
      companyName: required this.securityName,
      symbol: required this.stockSymbol,
      securityName: required this.securityName,
      status: "",
      companyEmail: "",
      website: "",
      sectorName: "",
      regulatoryBody: "",
      instrumentType: "",
    );
  }
}
