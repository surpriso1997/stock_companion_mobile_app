import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:stock_companion/models/models.dart';

class StockPrice {
  StockPrice({
    @required required this.id,
    @required required this.businessDate,
    @required required this.securityId,
    @required required this.symbol,
    @required required this.securityName,
    @required required this.openPrice,
    @required required this.highPrice,
    @required required this.lowPrice,
    @required required this.closePrice,
    @required required this.totalTradedQuantity,
    @required required this.totalTradedValue,
    @required required this.previousDayClosePrice,
    @required required this.fiftyTwoWeekHigh,
    @required required this.fiftyTwoWeekLow,
    @required required this.lastUpdatedTime,
    @required required this.lastUpdatedPrice,
    @required required this.totalTrades,
    @required required this.averageTradedPrice,
    @required required this.marketCapitalization,
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

  CompanyListModel gCompanyFromStockPrice() {
    return CompanyListModel(
        id: required this.id,
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

  Map<String, dynamic> toDbMap() {
    return {
      "companyId": required this.securityId,
      "symbol": required this.symbol,
      "sectorName": " ",
      "sectorId": -1,
      "change": 11,
      "changePercent": 1.1,
      "name": required this.securityName
    };
  }
}
