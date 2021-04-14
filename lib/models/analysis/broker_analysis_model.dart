class BrokerAnalysis {
  BrokerAnalysis({
    this.rank,
    this.scripSymbol,
    this.orderType,
    this.broker,
    this.quantity,
    this.percentOfTotalQty,
    this.amount,
    this.sharesTraded,
    this.averagePrice,
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

  factory BrokerAnalysis.fromJson(Map<String, dynamic> json) => BrokerAnalysis(
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
