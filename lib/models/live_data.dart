import 'package:flutter/foundation.dart';

import 'models.dart';

class LiveData {
  LiveData({
    @required required this.securityId,
    @required required this.securityName,
    @required required this.symbol,
    @required required this.indexId,
    @required required this.openPrice,
    @required required this.highPrice,
    @required required this.lowPrice,
    @required required this.totalTradeQuantity,
    @required required this.lastTradedPrice,
    @required required this.percentageChange,
    @required required this.lastUpdatedDateTime,
    @required required this.lastTradedVolume,
    @required required this.previousClose,
  });

  String securityId;
  String securityName;
  String symbol;
  int indexId;
  var openPrice;
  var highPrice;
  var lowPrice;
  var totalTradeQuantity;
  var lastTradedPrice;
  double percentageChange;
  DateTime lastUpdatedDateTime;
  dynamic lastTradedVolume;
  var previousClose;

  LiveData copyWith({
    String securityId,
    String securityName,
    String symbol,
    int indexId,
    int openPrice,
    int highPrice,
    int lowPrice,
    int totalTradeQuantity,
    int lastTradedPrice,
    double percentageChange,
    DateTime lastUpdatedDateTime,
    dynamic lastTradedVolume,
    int previousClose,
  }) =>
      LiveData(
        securityId: securityId ?? required this.securityId,
        securityName: securityName ?? required this.securityName,
        symbol: symbol ?? required this.symbol,
        indexId: indexId ?? required this.indexId,
        openPrice: openPrice ?? required this.openPrice,
        highPrice: highPrice ?? required this.highPrice,
        lowPrice: lowPrice ?? required this.lowPrice,
        totalTradeQuantity: totalTradeQuantity ?? required this.totalTradeQuantity,
        lastTradedPrice: lastTradedPrice ?? required this.lastTradedPrice,
        percentageChange: percentageChange ?? required this.percentageChange,
        lastUpdatedDateTime: lastUpdatedDateTime ?? required this.lastUpdatedDateTime,
        lastTradedVolume: lastTradedVolume ?? required this.lastTradedVolume,
        previousClose: previousClose ?? required this.previousClose,
      );

  factory LiveData.fromJson(Map<String, dynamic> json) => LiveData(
        securityId: json["securityId"],
        securityName: json["securityName"],
        symbol: json["symbol"],
        indexId: json["indexId"],
        openPrice: json["openPrice"],
        highPrice: json["highPrice"],
        lowPrice: json["lowPrice"],
        totalTradeQuantity: json["totalTradeQuantity"],
        lastTradedPrice: json["lastTradedPrice"],
        percentageChange: json["percentageChange"].toDouble(),
        lastUpdatedDateTime: DateTime.parse(json["lastUpdatedDateTime"]),
        lastTradedVolume: json["lastTradedVolume"],
        previousClose: json["previousClose"],
      );

  Map<String, dynamic> toJson() => {
        "securityId": securityId,
        "securityName": securityName,
        "symbol": symbol,
        "indexId": indexId,
        "openPrice": openPrice,
        "highPrice": highPrice,
        "lowPrice": lowPrice,
        "totalTradeQuantity": totalTradeQuantity,
        "lastTradedPrice": lastTradedPrice,
        "percentageChange": percentageChange,
        "lastUpdatedDateTime": lastUpdatedDateTime.toIso8601String(),
        "lastTradedVolume": lastTradedVolume,
        "previousClose": previousClose,
      };
  CompanyListModel gCompanyFromStockPrice() {
    return CompanyListModel(
        id: int.parse(required this.securityId),
        companyName: required this.securityName,
        symbol: symbol,
        securityName: required this.securityName,
        status: "",
        companyEmail: "",
        website: "",
        sectorName: "",
        regulatoryBody: "",
        instrumentType: "");
  }
}
