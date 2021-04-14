import 'dart:async';

import 'package:stock_companion/data/provider/api.dart';
import 'package:stock_companion/data/provider/database.dart';
import 'package:stock_companion/models/models.dart';
import 'package:stock_companion/utils/custom_exceptions.dart';
import 'package:stock_companion/utils/utils.dart';

import 'data_repository.dart';

class IStockPriceRepo {
  final String _baseUrl;
  IStockPriceRepo({String baseUrl}) : _baseUrl = baseUrl;

  List<StockPrice> _companies = [];

  List<StockPrice> get companies => _companies;
  int _currentPage = 1;
  int _totalPages = 1;
  int _totalItems;

  ///nots/company/list
  Future<List<StockPrice>> getCompanies(
      {bool isRefreshRequest = false,
      int securityId,
      String businessDate,
      bool isLoadMore = false}) async {
    if (_companies.isNotEmpty && isLoadMore == false) return _companies;

    if (_currentPage > _totalPages || _totalItems == _companies.length)
      return _companies;
    if (isLoadMore) _currentPage++;

    try {
      Map<String, dynamic> _params = {
        "size": 150,
        "page": _currentPage,
      };

      if (securityId != null) _params['securityId'] = securityId;
      if (businessDate != null) _params['businessDate'] = businessDate;

      final res = await getRequest(
        url: _baseUrl + "/nots/nepse-data/today-price",
        params: _params,
      );

      var data = res['content'];

      var _data =
          data.map<StockPrice>((item) => StockPrice.fromJson(item)).toList();

      if (!isLoadMore) _companies.clear();

      _companies.addAll(_data);

      _totalPages = res['totalPages'];
      _totalItems = res['totalElements'];

      _companies.forEach((element) {});
      // DataRepository().setCompaniesList(_companies);

      Timer(Duration(seconds: 5), () async {
        await DbHelper().addAllCompanies(companies);
      });

      return _companies;
    } on CustomApiExcception catch (e) {
      throw ApiException(message: e?.message ?? Constants.error_error);
    } catch (e) {
      throw ApiException(message: Constants.error_error);
    }
  }
}
