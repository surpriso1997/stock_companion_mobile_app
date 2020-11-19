import 'package:stock_companion/data/provider/api.dart';
import 'package:stock_companion/models/models.dart';
import 'package:stock_companion/utils/custom_exceptions.dart';
import 'package:stock_companion/utils/utils.dart';

class ITopTradesRepo {
  final String _baseUrl;

  ITopTradesRepo({String baseUrl}) : _baseUrl = baseUrl;

  Future<List<TopItem>> getTopGainers({bool isRefreshRequest = false}) async {
    final url = "$_baseUrl/";

    var time = DateTime.now();
    if (time.hour > 15 || time.hour < 11) {
      isRefreshRequest = false;
    }

    try {
      final res = (await getRequest(
        url: url,
        params: {},
      )) as List;

      var topItems = res.map<TopItem>((e) => TopItem.fromJson(e)).toList();

      return topItems;
    } catch (e) {
      throw ApiException(message: e?.nessage ?? Constants.error_error);
    }
  }

  getTopLosers() async {}
  getTurnovers() async {}
  getSharesTraded() async {}
  getTransactions() async {}
  getBrokers() async {}
}
