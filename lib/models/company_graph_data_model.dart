class CompanyGraphModel {
  CompanyGraphModel({
    required this.businessDate,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.previousDayClosePrice,
    required this.fiftyTwoWeekHigh,
    required this.lastTradedPrice,
    required this.totalTradedQuantity,
    required this.closePrice,
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
