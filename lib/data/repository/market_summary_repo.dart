import 'package:stock_companion/data/provider/api.dart';
import 'package:stock_companion/models/market_summary.dart';
import 'package:stock_companion/utils/utils.dart';

class IMarketSummaryRepository {
  IMarketSummaryRepository({String baseUrl}) : _baseUrl = baseUrl;

  final String _baseUrl;

  final List<MarketSummary> _summary = [];

  List get summary => _summary;

  getMarketSummary({bool isRefreshRequest = false}) async {
    var url = _baseUrl + "/nots/market-summary";

    try {
      List res = await getRequest(url: url);

      if (res.isNotEmpty) {
        var data =
            res.map<MarketSummary>((e) => MarketSummary.fromJson(e)).toList();

        if (!isRefreshRequest) {
          _summary.clear();
        }

        _summary.addAll(data);
      }
    } on CustomApiExcception catch (e) {
      throw ApiException(message: e.message);
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
