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
    // var _url = _baseUrl + "/nots/nepse-data/marketdepth/$id";

    var _url = _baseUrl + "/nots/nepse-data/marketdepth/131";

    try {
      var res = await getRequest(url: _url);

      if (res is Map) {
        var data = MarketDepthData.fromJson(res);

        return data;
      } else if (res == "") {
        throw MarketClosedException();
      }
    } on CustomApiExcception catch (e) {
      throw ApiException(message: e.message);
    } catch (e) {
      if (e is MarketClosedException) {
        throw MarketClosedException();
      }

      throw ApiException(message: e.toString());
    }
  }
}
