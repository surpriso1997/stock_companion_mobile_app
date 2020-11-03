import 'package:flutter/foundation.dart';
import 'package:stock_companion/data/provider/api.dart';
import 'package:stock_companion/models/models.dart';
import 'package:stock_companion/utils/constants.dart';
import 'package:stock_companion/utils/custom_exceptions.dart';

class IMarketReposity {
  String _baseUrl;
  IMarketReposity({@required String baseUrl})
      :
        // assert(_baseUrl != null),
        _baseUrl = baseUrl;

  getMarketOpenStatus() async {}

  Future<List<NepseIndex>> getNepseIndex() async {
    var _url = _baseUrl + "/nots/nepse-index";
    print("lol");
    try {
      var res = (await getRequest(url: _url)) as List;
      print(res);
      var _indices =
          res.map<NepseIndex>((item) => NepseIndex.fromJson(item)).toList();
      return _indices;
    } catch (e) {
      throw ApiException(message: e?.message ?? Constants.error_error);
    }
  }

  Future<List<SubIndex>> getSubIndices() async {
    var _url = _baseUrl + "/nots";

    try {
      var res = (await getRequest(url: _url)) as List;
      var _indices =
          res.map<SubIndex>((item) => SubIndex.fromJson(item)).toList();
      return _indices;
    } catch (e) {
      throw ApiException(message: e.message ?? Constants.error_error);
    }
  }

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

enum MarketStatus { Open, Closed }
