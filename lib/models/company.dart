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
    this.id,
    this.companyName,
    this.symbol,
    this.securityName,
    this.sectorName,
    this.lastTradedPrice,
    this.highPrice,
    this.lowPrice,
    this.fiftyTwoWeekLow,
    this.fiftyTwoWeekHigh,
    this.totalTradedQuantity,
    this.totalTrades,
    this.peRatio,
    this.eps,
    this.oneYearYield,
    this.bookValue,
    this.pbv,
    this.paidUpValue,
    this.totalListedShares,
    this.totalPaidUpValue,
    this.marketCap,
  });
}
