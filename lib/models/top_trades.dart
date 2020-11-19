import 'package:meta/meta.dart';

class TopItem {
  TopItem({
    this.totalTrades,
    this.closingPrice,
    this.turnover,
    this.shareTraded,
    this.lastTradedPrice,
    this.symbol,
    this.ltp,
    this.pointChange,
    this.percentageChange,
    this.securityName,
    this.securityId,
  });

  final String symbol;
  final double ltp;
  final double pointChange;
  final double percentageChange;
  final String securityName;
  final int securityId;

  final String totalTrades;
  final String closingPrice;
  final String turnover;
  final String shareTraded;
  final String lastTradedPrice;

  factory TopItem.fromJson(Map<String, dynamic> json) => TopItem(
        symbol: json["symbol"] ?? "",
        ltp: json["ltp"].toDouble() ?? "",
        pointChange: json["pointChange"].toDouble() ?? '',
        percentageChange: json["percentageChange"].toDouble() ?? '',
        securityName: json["securityName"] ?? '',
        securityId: json["securityId"] ?? '',
        totalTrades: json['totalTrades'] ?? '',
        closingPrice: json['closingPrice'] ?? '',
        turnover: json['turnover'] ?? '',
        shareTraded: json['shareTraded'] ?? '',
        lastTradedPrice: json['lastTradedPrice'] ?? '',
      );
}
