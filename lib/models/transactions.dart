import 'package:meta/meta.dart';

class Transactions {
  Transactions({
    @required this.securityId,
    @required this.totalTrades,
    @required this.lastTradedPrice,
    @required this.securityName,
    @required this.symbol,
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
        securityId: securityId ?? this.securityId,
        totalTrades: totalTrades ?? this.totalTrades,
        lastTradedPrice: lastTradedPrice ?? this.lastTradedPrice,
        securityName: securityName ?? this.securityName,
        symbol: symbol ?? this.symbol,
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
