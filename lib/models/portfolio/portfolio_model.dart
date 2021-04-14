class PortfolioModel {
  var id;
  var companyId;
  var symbol;
  var sectorName;
  var sectorId;
  var lastTradedPrice;
  var buyingPrice;
  var buyingUnits;
  var buyingDate;

  PortfolioModel({
    this.id,
    this.companyId,
    this.sectorId,
    this.sectorName,
    this.buyingDate,
    this.buyingPrice,
    this.lastTradedPrice,
    this.symbol,
    this.buyingUnits,
  });

  factory PortfolioModel.fromJson(Map json) {
    return PortfolioModel(
      id: json['id'],
      companyId: json['companyId'],
      symbol: json["symbol"],
      sectorName: json['sectorName'],
      sectorId: json['sectorId'],
      lastTradedPrice: json['lastTradedPrice'],
      buyingDate: json['byuyingDate'],
      buyingPrice: json['buyingPrice'],
      buyingUnits: json['buyingUnits'],
    );
  }
}
