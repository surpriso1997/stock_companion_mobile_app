import 'package:stock_companion/models/stock_price.dart';

class CompanyDataModel {
  CompanyDataModel({
    this.securityId,
    this.securityName,
    this.symbol,
    this.indexId,
    this.openPrice,
    this.highPrice,
    this.lowPrice,
    this.totalTradeQuantity,
    this.lastTradedPrice,
    this.percentageChange,
    this.lastUpdatedDateTime,
    this.lastTradedVolume,
    this.previousClose,
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
      securityId: this.securityId,
      securityName: this.securityName,
      symbol: this.symbol,
      openPrice: this.openPrice,
      highPrice: this.highPrice,
      lowPrice: this.lowPrice,
      averageTradedPrice: (lowPrice + highPrice) / 2,
      lastUpdatedPrice: this.lastTradedPrice,
      marketCapitalization: null,
      previousDayClosePrice: this.previousClose,
      id: this.securityId,
      lastUpdatedTime: this.lastUpdatedDateTime.toString(),
      fiftyTwoWeekLow: null,
      closePrice: null,
      businessDate: null,
      fiftyTwoWeekHigh: null,
      totalTradedQuantity: this.lastTradedVolume,
      totalTradedValue: null,
      totalTrades: null,
    );
  }
}
