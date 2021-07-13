import 'package:stock_companion/models/stock_price.dart';

class CompanyDataModel {
  CompanyDataModel({
    required this.securityId,
    required this.securityName,
    required this.symbol,
    required this.indexId,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.totalTradeQuantity,
    required this.lastTradedPrice,
    required this.percentageChange,
    required this.lastUpdatedDateTime,
    required this.lastTradedVolume,
    required this.previousClose,
  });

  String securityId;
  String securityName;
  String symbol;
  var indexId;
  var openPrice;
  var highPrice;
  var lowPrice;
  var totalTradeQuantity;
  var lastTradedPrice;
  double percentageChange;
  DateTime lastUpdatedDateTime;
  dynamic lastTradedVolume;
  var previousClose;

  factory CompanyDataModel.fromJson(Map<String, dynamic> json) =>
      CompanyDataModel(
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

  StockPrice toStockPrice() {
    return StockPrice(
      securityId: required this.securityId,
      securityName: required this.securityName,
      symbol: required this.symbol,
      openPrice: required this.openPrice,
      highPrice: required this.highPrice,
      lowPrice: required this.lowPrice,
      averageTradedPrice: (lowPrice + highPrice) / 2,
      lastUpdatedPrice: required this.lastTradedPrice,
      marketCapitalization: null,
      previousDayClosePrice: required this.previousClose,
      id: required this.securityId,
      lastUpdatedTime: required this.lastUpdatedDateTime.toString(),
      fiftyTwoWeekLow: null,
      closePrice: null,
      businessDate: null,
      fiftyTwoWeekHigh: null,
      totalTradedQuantity: required this.lastTradedVolume,
      totalTradedValue: null,
      totalTrades: null,
    );
  }
}
