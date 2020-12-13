class FloorSheetData {
  final PageInfo pageInfo;
  final List<Details> details;

  const FloorSheetData({this.pageInfo, this.details});

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
  const TotalInfo({this.totalAmount, this.totalQty, this.totalTrades});

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
    this.totalElements,
    this.totalPages,
    this.last,
    this.size,
    this.sorted,
    this.number,
    this.numberOfElements,
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
    this.id,
    this.contractId,
    this.contractQuantity,
    this.contracyType,
    this.stockSymbol,
    this.buyerMemberId,
    this.sellerMemberId,
    this.contractRate,
    this.businessDate,
    this.tradeBookId,
    this.stockId,
    this.buyerBrokerName,
    this.sellerBrokerName,
    this.securityName,
    this.contractAmount,
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
}
