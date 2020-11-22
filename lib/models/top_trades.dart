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
  final String ltp;
  final String pointChange;
  final String percentageChange;
  final String securityName;
  final int securityId;

  final String totalTrades;
  final String closingPrice;
  final String turnover;
  final String shareTraded;
  final String lastTradedPrice;

  factory TopItem.fromJson(Map<String, dynamic> json) {
    print(json['turnover']);

    return TopItem(
      symbol: json["symbol"] ?? "",
      ltp: json["ltp"] == null ? "" : json["ltp"].toString(),
      pointChange:
          json["pointChange"] == null ? "" : json["pointChange"].toString(),
      percentageChange: json["percentageChange"] == null
          ? ""
          : json["percentageChange"].toString(),
      securityName: json["securityName"] == null ? "" : json["securityName"],
      securityId: json["securityId"] ?? -1,
      totalTrades:
          json['totalTrades'] == null ? "" : json['totalTrades'].toString(),
      closingPrice:
          json['closingPrice'] == null ? "" : json['closingPrice'].toString(),
      turnover: json['turnover'] == null ? "" : json['turnover'].toString(),
      shareTraded:
          json['shareTraded'] == null ? "" : json['shareTraded'].toString(),
      lastTradedPrice: json['lastTradedPrice'] == null
          ? ""
          : json['lastTradedPrice'].toString(),
    );
  }
}
