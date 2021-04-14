import 'package:stock_companion/data/provider/api.dart';
import 'package:stock_companion/data/provider/broker_ana.dart';
import 'package:stock_companion/models/analysis/broker_analysis_model.dart';
import 'package:stock_companion/utils/utils.dart';

class IBrokerAnalysisRepository {
  final vmIp = "52.148.96.72";

  List<BrokerAnalysisModel> _buy = [];
  List<BrokerAnalysisModel> get buy => _buy;

  List<BrokerAnalysisModel> _sell = [];
  List<BrokerAnalysisModel> get sell => _sell;

  getBuyAnalytics(int brokerId) async {
    var url = "$vmIp/";
    var params = {"buy_type": "buy", "broker_no": brokerId};

    try {
      // final res = await getRequest(url: url, params: params);
      final res = broker_analsis_data;
      var data = res.map((e) => BrokerAnalysisModel.fromJson(e)).toList();
      _buy = data;
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
      // final res = getRequest(url: url, params: params);
      final res = broker_analsis_data;

      var data = res.map((e) => BrokerAnalysisModel.fromJson(e)).toList();
      _sell = data;
    } on CustomApiExcception catch (e) {
      throw ApiException(message: e.message);
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
