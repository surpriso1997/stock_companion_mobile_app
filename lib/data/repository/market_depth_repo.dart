import 'package:stock_companion/data/provider/api.dart';
import 'package:stock_companion/models/market_depth/market_depth.dart';
import 'package:stock_companion/utils/utils.dart';

class IMarketDepthRepository {
  IMarketDepthRepository(String baseUrl) : _baseUrl = baseUrl;

  final String _baseUrl;

  MarketDepthData _depthData;

  MarketDepthData get marketDepth => _depthData;

  Future<MarketDepthData> getMarketDepth(int id,
      {bool isRefreshRequest = false}) async {
    var _url = _baseUrl + "/nots/nepse-data/marketdepth/$id";

    try {
      var res = await getRequest(url: _url);
      var data = MarketDepthData.fromJson(res);

      return data;
    } catch (e) {
      if (e.message != null) {
        throw ApiException(message: e.message.toString() ?? "An Error occrred");
      } else {
        throw ApiException(message: "An error occurred");
      }
    }
  }
}
