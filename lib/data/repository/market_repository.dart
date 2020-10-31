class MarketRepository {
  getMarketOpenStatus() {}
  getMarketIndices() {}
  getNotification() {}
  getMarketDepth() {}

  getIndexHistoru() {}

  ///    /nots/market-summary/
  getMarketSummary() {}

  getSubIndicList() {}

  /// nots/top-ten/transaction?all=true
  getTopTenTransactions() {}

  getTopTen() {}

  getDailyTradeStat() {}
  getNepseIndices() {}

  getLiveData() {}
  getIndexGraphData(
    int indexId,
  ) {}

  getCompanyGraphData() {}

  getFloorSheet() {}

  getBrokersList() {}
  getListedStocks() {}

  getPurposed() {}
  getSebonIssues() {}
  getBullion() {}
  getForex() {}
  getOpenings() {}
}

enum IndexType {
  Nepse,
  Float,
  Sensitive,
  SensitiveFloat,
  Banking,
  Hotels,
}

enum DurationType { Daily, Weekly, Monnthly, Quarterly, Yearly }

class SubIndex {
  final String name;
  final int id;

  const SubIndex({this.name, this.id});
}

enum MarketStatus { Open, Closed }
