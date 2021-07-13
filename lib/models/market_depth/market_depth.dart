class MarketDepthData {
  MarketDepthData({
    required this.totalBuyQty,
    required this.marketDepth,
    required this.totalSellQty,
  });

  int totalBuyQty;
  MarketDepthClass marketDepth;
  int totalSellQty;

  factory MarketDepthData.fromJson(Map<String, dynamic> json) =>
      MarketDepthData(
        totalBuyQty: json["totalBuyQty"],
        marketDepth: MarketDepthClass.fromJson(json["marketDepth"]),
        totalSellQty: json["totalSellQty"],
      );

  Map<String, dynamic> toJson() => {
        "totalBuyQty": totalBuyQty,
        "marketDepth": marketDepth.toJson(),
        "totalSellQty": totalSellQty,
      };
}

class MarketDepthClass {
  MarketDepthClass({
    required this.buyMarketDepthList,
    required this.sellMarketDepthList,
  });

  List<MarketDepthList> buyMarketDepthList;
  List<MarketDepthList> sellMarketDepthList;

  factory MarketDepthClass.fromJson(Map<String, dynamic> json) =>
      MarketDepthClass(
        buyMarketDepthList: List<MarketDepthList>.from(
            json["buyMarketDepthList"].map((x) => MarketDepthList.fromJson(x))),
        sellMarketDepthList: List<MarketDepthList>.from(
            json["sellMarketDepthList"]
                .map((x) => MarketDepthList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "buyMarketDepthList":
            List<dynamic>.from(buyMarketDepthList.map((x) => x.toJson())),
        "sellMarketDepthList":
            List<dynamic>.from(sellMarketDepthList.map((x) => x.toJson())),
      };
}

class MarketDepthList {
  MarketDepthList({
    required this.stockId,
    required this.orderBookOrderPrice,
    required this.quantity,
    required this.orderCount,
    required this.isBuy,
  });

  int stockId;
  int orderBookOrderPrice;
  int quantity;
  int orderCount;
  int isBuy;

  factory MarketDepthList.fromJson(Map<String, dynamic> json) =>
      MarketDepthList(
        stockId: json["stockId"],
        orderBookOrderPrice: json["orderBookOrderPrice"],
        quantity: json["quantity"],
        orderCount: json["orderCount"],
        isBuy: json["isBuy"],
      );

  Map<String, dynamic> toJson() => {
        "stockId": stockId,
        "orderBookOrderPrice": orderBookOrderPrice,
        "quantity": quantity,
        "orderCount": orderCount,
        "isBuy": isBuy,
      };
}
