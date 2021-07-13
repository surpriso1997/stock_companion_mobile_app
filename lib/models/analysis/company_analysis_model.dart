class CompanyAnaylisModel {
  CompanyAnaylisModel({
    required this.rank,
    required this.scripSymbol,
    required this.orderType,
    required this.broker,
    required this.quantity,
    required this.percentOfTotalQty,
    required this.amount,
    required this.sharesTraded,
    required this.averagePrice,
  });

  int rank;
  String scripSymbol;
  String orderType;
  String broker;
  int quantity;
  double percentOfTotalQty;
  int amount;
  int sharesTraded;
  int averagePrice;

  factory CompanyAnaylisModel.fromJson(Map<String, dynamic> json) =>
      CompanyAnaylisModel(
        rank: json["Rank"],
        scripSymbol: json["Scrip Symbol"],
        orderType: json["Order Type"],
        broker: json["Broker"],
        quantity: json["Quantity"],
        percentOfTotalQty: json["Percent of Total Qty"].toDouble(),
        amount: json["Amount"],
        sharesTraded: json["Shares Traded"],
        averagePrice: json["Average Price"],
      );

  Map<String, dynamic> toJson() => {
        "Rank": rank,
        "Scrip Symbol": scripSymbol,
        "Order Type": orderType,
        "Broker": broker,
        "Quantity": quantity,
        "Percent of Total Qty": percentOfTotalQty,
        "Amount": amount,
        "Shares Traded": sharesTraded,
        "Average Price": averagePrice,
      };
}
