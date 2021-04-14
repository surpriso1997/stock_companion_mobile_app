class CompanyGraphModel {
  CompanyGraphModel({
    this.businessDate,
    this.openPrice,
    this.highPrice,
    this.lowPrice,
    this.previousDayClosePrice,
    this.fiftyTwoWeekHigh,
    this.lastTradedPrice,
    this.totalTradedQuantity,
    this.closePrice,
  });

  String businessDate;
  int openPrice;
  int highPrice;
  int lowPrice;
  int previousDayClosePrice;
  int fiftyTwoWeekHigh;
  int lastTradedPrice;
  int totalTradedQuantity;
  int closePrice;

  factory CompanyGraphModel.fromJson(Map<String, dynamic> json) =>
      CompanyGraphModel(
        businessDate: json["businessDate"],
        openPrice: json["openPrice"],
        highPrice: json["highPrice"],
        lowPrice: json["lowPrice"],
        previousDayClosePrice: json["previousDayClosePrice"],
        fiftyTwoWeekHigh: json["fiftyTwoWeekHigh"],
        lastTradedPrice: json["lastTradedPrice"],
        totalTradedQuantity: json["totalTradedQuantity"],
        closePrice: json["closePrice"],
      );
}
