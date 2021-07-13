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
    required this.id,
    required this.companyId,
    required this.sectorId,
    required this.sectorName,
    required this.buyingDate,
    required this.buyingPrice,
    required this.lastTradedPrice,
    required this.symbol,
    required this.buyingUnits,
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
