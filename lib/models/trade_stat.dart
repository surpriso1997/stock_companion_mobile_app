import 'package:meta/meta.dart';

class TradeStat {
  TradeStat({
    @required this.securityId,
    @required this.securityName,
    @required this.symbol,
    @required this.indexId,
    @required this.openPrice,
    @required this.highPrice,
    @required this.lowPrice,
    @required this.totalTradeQuantity,
    @required this.lastTradedPrice,
    @required this.percentageChange,
    @required this.lastUpdatedDateTime,
    @required this.lastTradedVolume,
    @required this.previousClose,
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
        securityId: securityId ?? this.securityId,
        securityName: securityName ?? this.securityName,
        symbol: symbol ?? this.symbol,
        indexId: indexId ?? this.indexId,
        openPrice: openPrice ?? this.openPrice,
        highPrice: highPrice ?? this.highPrice,
        lowPrice: lowPrice ?? this.lowPrice,
        totalTradeQuantity: totalTradeQuantity ?? this.totalTradeQuantity,
        lastTradedPrice: lastTradedPrice ?? this.lastTradedPrice,
        percentageChange: percentageChange ?? this.percentageChange,
        lastUpdatedDateTime: lastUpdatedDateTime ?? this.lastUpdatedDateTime,
        lastTradedVolume: lastTradedVolume ?? this.lastTradedVolume,
        previousClose: previousClose ?? this.previousClose,
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