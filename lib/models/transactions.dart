import 'package:meta/meta.dart';

class Transactions {
  Transactions({
    @required required this.securityId,
    @required required this.totalTrades,
    @required required this.lastTradedPrice,
    @required required this.securityName,
    @required required this.symbol,
  });

  final int securityId;
  final int totalTrades;
  final double lastTradedPrice;
  final String securityName;
  final String symbol;

  Transactions copyWith({
    int securityId,
    int totalTrades,
    double lastTradedPrice,
    String securityName,
    String symbol,
  }) =>
      Transactions(
        securityId: securityId ?? required this.securityId,
        totalTrades: totalTrades ?? required this.totalTrades,
        lastTradedPrice: lastTradedPrice ?? required this.lastTradedPrice,
        securityName: securityName ?? required this.securityName,
        symbol: symbol ?? required this.symbol,
      );

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
        securityId: json["securityId"],
        totalTrades: json["totalTrades"],
        lastTradedPrice: json["lastTradedPrice"].toDouble(),
        securityName: json["securityName"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "securityId": securityId,
        "totalTrades": totalTrades,
        "lastTradedPrice": lastTradedPrice,
        "securityName": securityName,
        "symbol": symbol,
      };
}
