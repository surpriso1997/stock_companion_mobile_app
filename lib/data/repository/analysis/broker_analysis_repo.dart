import 'package:stock_companion/data/provider/api.dart';
import 'package:stock_companion/utils/utils.dart';

class IBrokerAnalysisRepository {
  final vmIp = "";

  getBuyAnalytics(int brokerId) async {
    var url = "$vmIp/";

    var params = {"buy_type": "buy", "broker_no": brokerId};

    try {
      final data = getRequest(url: url, params: params);
    } on CustomApiExcception catch (e) {
      throw ApiException(message: e.message);
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  getSellAnalytics(int brokerId) async {
    var url = "$vmIp/";

    var params = {"buy_type": "sell", "broker_no": brokerId};

    try {
      final data = getRequest(url: url, params: params);
    } on CustomApiExcception catch (e) {
      throw ApiException(message: e.message);
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
