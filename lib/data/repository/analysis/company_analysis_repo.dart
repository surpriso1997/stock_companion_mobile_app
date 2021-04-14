import 'package:stock_companion/data/provider/api.dart';
import 'package:stock_companion/data/provider/company_analysis_data.dart';
import 'package:stock_companion/models/analysis/company_analysis_model.dart';
import 'package:stock_companion/utils/utils.dart';

class ICompanyAnalysisRepository {
  final vmIp = "52.148.96.72";

  List<CompanyAnalysis> _buy = [];
  List<CompanyAnalysis> get buy => _buy;

  List<CompanyAnalysis> _sell = [];
  List<CompanyAnalysis> get sell => _sell;

  getBuyAnalytics(int companyId) async {
    var url = "$vmIp/";
    var params = {"buy_type": "buy", "Company_no": companyId};

    try {
      // final res = await getRequest(url: url, params: params);
      final res = companay_analysis_data;
      var data = res.map((e) => CompanyAnalysis.fromJson(e)).toList();
      _buy = data;
    } on CustomApiExcception catch (e) {
      throw ApiException(message: e.message);
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  getSellAnalytics(int companyId) async {
    var url = "$vmIp/";

    var params = {"buy_type": "sell", "Company_no": companyId};

    try {
      final res = getRequest(url: url, params: params);
      var data = res.map((e) => CompanyAnalysis.fromJson(e)).toList();
      _sell = data;
    } on CustomApiExcception catch (e) {
      throw ApiException(message: e.message);
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
