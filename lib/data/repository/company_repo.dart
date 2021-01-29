import 'package:stock_companion/data/provider/api.dart';
import 'package:stock_companion/models/company_list_model.dart';
import 'package:stock_companion/utils/custom_exceptions.dart';
import 'package:stock_companion/utils/utils.dart';

class ICompanyRepo {
  final String _baseUrl;
  ICompanyRepo({String baseUrl}) : _baseUrl = baseUrl;

  List<CompanyListModel> _companies = [];

  List<CompanyListModel> get companies => _companies;

  ///nots/company/list
  Future<List<CompanyListModel>> getCompanies(
      {bool isRefreshRequest = false}) async {
    if (_companies.isNotEmpty) return _companies;
    try {
      final res = await getRequest(url: _baseUrl + "/nots/company/list");
      _companies = res
          .map<CompanyListModel>((item) => CompanyListModel.fromJson(item))
          .toList();

      return _companies;
    } catch (e) {
      throw ApiException(message: e?.message ?? Constants.error_error);
    }
  }
}
