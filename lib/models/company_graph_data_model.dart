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
  var openPrice;
  var highPrice;
  var lowPrice;
  var previousDayClosePrice;
  var fiftyTwoWeekHigh;
  var lastTradedPrice;
  var totalTradedQuantity;
  var closePrice;

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
