import 'package:stock_companion/data/provider/api.dart';
import 'package:stock_companion/data/provider/broker_ana.dart';
import 'package:stock_companion/models/analysis/broker_analysis_model.dart';
import 'package:stock_companion/utils/utils.dart';

class IBrokerAnalysisRepository {
  final vmIp = "http://13.76.102.39";

  List<BrokerAnalysisModel> _buy = [];
  List<BrokerAnalysisModel> get buy => _buy;

  List<BrokerAnalysisModel> _sell = [];
  List<BrokerAnalysisModel> get sell => _sell;

  getBuyAnalytics(int brokerId) async {
    var url = "$vmIp/top_broker_trades";
    var params = {"TransactionType": "Buy", "BrokerNo": brokerId.toString()};

    try {
      final res = await getRequest(url: url, params: params);
      // final res = broker_analsis_data;
      List<BrokerAnalysisModel> data = res
          .map<BrokerAnalysisModel>((e) => BrokerAnalysisModel.fromJson(e))
          .toList();
      _buy = data;
    } on CustomApiExcception catch (e) {
      throw ApiException(message: e.message);
    } catch (e) {
      print(e.toString());
      throw ApiException(message: e.toString());
    }
  }

  getSellAnalytics(int brokerId) async {
    var url = "$vmIp/top_broker_trades";

    var params = {"TransactionType": "Sell", "BrokerNo": brokerId.toString()};

    try {
      final res = await getRequest(url: url, params: params);
      // final res = broker_analsis_data;

      List<BrokerAnalysisModel> data = res
          .map<BrokerAnalysisModel>((e) => BrokerAnalysisModel.fromJson(e))
          .toList();
      _sell = data;
    } on CustomApiExcception catch (e) {
      throw ApiException(message: e.message);
    } catch (e) {
      print(e.toString());
      throw ApiException(message: e.toString());
    }
  }
}
