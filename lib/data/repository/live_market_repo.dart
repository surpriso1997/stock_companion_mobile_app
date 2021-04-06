import 'package:flutter/foundation.dart';
import 'package:stock_companion/data/provider/api.dart';
import 'package:stock_companion/models/live_data.dart';
import 'package:stock_companion/utils/custom_exceptions.dart';
import 'package:stock_companion/utils/utils.dart';

class ILiveMarketRepository {
  String _baseUrl;
  ILiveMarketRepository({@required String baseUrl}) : _baseUrl = baseUrl;

  int _currentPage = 1;

  List<LiveData> _liveData = [];
  List<LiveData> get liveData => _liveData;

  Future getLiveData(
      {bool isRefreshRequest = false,
      String businessDate,
      bool isLoadMore = false,
      int securityId}) async {
    // date format: 2020-10-10
    var url = '$_baseUrl/nots/securityDailyTradeStat/58/';

    if (securityId != null) {
      url = url + "$securityId";
    }

    if (isLoadMore) {
      _currentPage++;
    }

    try {
      var res = await getRequest(url: url, params: {
        "size": 100,
        'page': _currentPage,
        'businessDate': businessDate
      });

      var data = res.map<LiveData>((e) => LiveData.fromJson(e)).toList();

      if (!isLoadMore) {
        _liveData.addAll(data);
      }

      return _liveData;
    } catch (e) {
      throw ApiException(message: e?.message ?? Constants.error_error);
    }
  }
}
