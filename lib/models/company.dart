class Company {
  int id;
  String companyName;
  String symbol;
  String securityName;
  String sectorName;

  /// transaction data
  ///
  var lastTradedPrice;
  var previousClosingPrice;
  var lowPrice;
  var highPrice;

  var totalTrades;
  var totalTradedQuantity;
  var businessDate;
  var fiftyTwoWeekHigh;
  var fiftyTwoWeekLow;

  /// other detials

  var peRatio;
  var eps;
  var oneYearYield;
  var bookValue;
  var pbv;
  var paidUpValue;
  var totalListedShares;
  var totalPaidUpValue;
  var marketCap;

  Company({
    required this.id,
    required this.companyName,
    required this.symbol,
    required this.securityName,
    required this.sectorName,
    required this.lastTradedPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.fiftyTwoWeekLow,
    required this.fiftyTwoWeekHigh,
    required this.totalTradedQuantity,
    required this.totalTrades,
    required this.peRatio,
    required this.eps,
    required this.oneYearYield,
    required this.bookValue,
    required this.pbv,
    required this.paidUpValue,
    required this.totalListedShares,
    required this.totalPaidUpValue,
    required this.marketCap,
  });
}
