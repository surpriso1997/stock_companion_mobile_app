import 'package:stock_companion/data/provider/api.dart';
import 'package:stock_companion/models/company_dailyData.dart';

class DataRepository {
  static DataRepository _instance = DataRepository._private();

  DataRepository._private();

  factory DataRepository() => _instance;

  List<CompanyDataModel> _companiesList = [];
  List<CompanyDataModel> get companies => _companiesList;

  setCompaniesList(List<CompanyDataModel> items) {
    _companiesList = items;
  }

  getDataOfAllCompanies() async {
    var url =
        "https://newweb.nepalstock.com/api/nots/securityDailyTradeStat/58";

    try {
      List res = await getRequest(url: url);

      var data = res
          .map<CompanyDataModel>((e) => CompanyDataModel.fromJson(e))
          .toList();

      _companiesList = data;
    } catch (e) {
      print(e);
    }
  }
}
