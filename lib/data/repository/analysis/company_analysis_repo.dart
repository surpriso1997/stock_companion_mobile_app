import 'package:stock_companion/data/provider/api.dart';
import 'package:stock_companion/data/provider/company_analysis_data.dart';
import 'package:stock_companion/models/analysis/company_analysis_model.dart';
import 'package:stock_companion/utils/utils.dart';

class ICompanyAnalysisRepository {
  final vmIp = "http://13.76.102.39/top_scrip_trades";

  List<CompanyAnaylisModel> _buy = [];
  List<CompanyAnaylisModel> get buy => _buy;

  List<CompanyAnaylisModel> _sell = [];
  List<CompanyAnaylisModel> get sell => _sell;
  // "http://13.76.102.39/top_scrip_trades/?TransactionType=Buy&ScripSymbol=PCBL",

  getBuyAnalytics(String scripSymbol) async {
    var url = "$vmIp";
    var params = {"TransactionType": "Buy", "ScripSymbol": scripSymbol};

    try {
      final res = await getRequest(url: url, params: params);
      // final res = companay_analysis_data;
      List<CompanyAnaylisModel> data = res
          .map<CompanyAnaylisModel>((e) => CompanyAnaylisModel.fromJson(e))
          .toList();
      _buy = data;
    } on CustomApiExcception catch (e) {
      throw ApiException(message: e.message);
    } catch (e) {
      print(e.toString());
      throw ApiException(message: e.toString());
    }
  }

  getSellAnalytics(String scripSymbol) async {
    var url = "$vmIp";

    var params = {"TransactionType": "Sell", "ScripSymbol": scripSymbol};

    try {
      final res = await getRequest(url: url, params: params);
      // final res = companay_analysis_data;
      List<CompanyAnaylisModel> data = res
          .map<CompanyAnaylisModel>((e) => CompanyAnaylisModel.fromJson(e))
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
