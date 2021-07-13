import 'package:meta/meta.dart';

class TradeStat {
  TradeStat({
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

  final String securityId;
  final String securityName;
  final String symbol;
  final int indexId;
  final int openPrice;
  final int highPrice;
  final int lowPrice;
  final int totalTradeQuantity;
  final int lastTradedPrice;
  final double percentageChange;
  final DateTime lastUpdatedDateTime;
  final dynamic lastTradedVolume;
  final int previousClose;

  TradeStat copyWith({
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
      TradeStat(
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

  factory TradeStat.fromJson(Map<String, dynamic> json) => TradeStat(
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
}
