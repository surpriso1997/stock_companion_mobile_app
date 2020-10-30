class MarketRepository {
  getMarketOpenStatus() {}
  getMarketIndices() {}
  getNotification() {}
  getMarketDepth() {}

  getSubIndicList() {}

  getIndexGraphData(
    int indexId,
  ) {}

  getCompanyGraphData() {}

  getFloorSheet() {}

  getBrokersList() {}
  getListedStocks() {}
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
