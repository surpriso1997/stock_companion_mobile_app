import 'package:meta/meta.dart';

class StockPrice {
  StockPrice({
    @required this.id,
    @required this.businessDate,
    @required this.securityId,
    @required this.symbol,
    @required this.securityName,
    @required this.openPrice,
    @required this.highPrice,
    @required this.lowPrice,
    @required this.closePrice,
    @required this.totalTradedQuantity,
    @required this.totalTradedValue,
    @required this.previousDayClosePrice,
    @required this.fiftyTwoWeekHigh,
    @required this.fiftyTwoWeekLow,
    @required this.lastUpdatedTime,
    @required this.lastUpdatedPrice,
    @required this.totalTrades,
    @required this.averageTradedPrice,
    @required this.marketCapitalization,
  });

  final dynamic id;
  final DateTime businessDate;
  final dynamic securityId;
  final String symbol;
  final String securityName;
  final dynamic openPrice;
  final dynamic highPrice;
  final dynamic lowPrice;
  final dynamic closePrice;
  final dynamic totalTradedQuantity;
  final dynamic totalTradedValue;
  final dynamic previousDayClosePrice;
  final dynamic fiftyTwoWeekHigh;
  final double fiftyTwoWeekLow;
  final String lastUpdatedTime;
  final dynamic lastUpdatedPrice;
  final dynamic totalTrades;
  final double averageTradedPrice;
  final double marketCapitalization;

  factory StockPrice.fromJson(Map<String, dynamic> json) => StockPrice(
        id: json["id"],
        businessDate: DateTime.parse(json["businessDate"]),
        securityId: json["securityId"],
        symbol: json["symbol"],
        securityName: json["securityName"],
        openPrice: json["openPrice"],
        highPrice: json["highPrice"],
        lowPrice: json["lowPrice"],
        closePrice: json["closePrice"],
        totalTradedQuantity: json["totalTradedQuantity"],
        totalTradedValue: json["totalTradedValue"],
        previousDayClosePrice: json["previousDayClosePrice"],
        fiftyTwoWeekHigh: json["fiftyTwoWeekHigh"],
        fiftyTwoWeekLow: json["fiftyTwoWeekLow"],
        lastUpdatedTime: json["lastUpdatedTime"],
        lastUpdatedPrice: json["lastUpdatedPrice"],
        totalTrades: json["totalTrades"],
        averageTradedPrice: json["averageTradedPrice"],
        marketCapitalization: json["marketCapitalization"],
      );
}
