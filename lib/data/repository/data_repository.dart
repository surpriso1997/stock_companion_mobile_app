import 'package:stock_companion/models/stock_price.dart';

class DataRepository {
  static DataRepository _instance = DataRepository._private();

  DataRepository._private();

  factory DataRepository() => _instance;

  List<StockPrice> _companiesList = [];
  List<StockPrice> get companies => _companiesList;

  setCompaniesList(List<StockPrice> items) {
    _companiesList = items;
  }
}
