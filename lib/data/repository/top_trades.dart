import 'package:stock_companion/data/provider/api.dart';
import 'package:stock_companion/models/models.dart';
import 'package:stock_companion/utils/custom_exceptions.dart';
import 'package:stock_companion/utils/utils.dart';

class ITopTradesRepo {
  final String _baseUrl;

  ITopTradesRepo({String baseUrl}) : _baseUrl = baseUrl;

  List<TopItem> _gainers = [];
  List<TopItem> get gainers => _gainers;

  List<TopItem> _losers = [];
  List<TopItem> get losers => _losers;

  List<TopItem> _turnovers = [];
  List<TopItem> get turnovers => _turnovers;

  Future<List<TopItem>> getTopGainers(
      {bool isRefreshRequest = false, int size = 10}) async {
    final url = "$_baseUrl/nots/top-ten/top-gainer";

    var time = DateTime.now();
    if (time.hour > 15 || time.hour < 11) {
      isRefreshRequest = false;
    }

    try {
      final res = (await getRequest(
        url: url,
        params: {'all': true, 'size': size},
      )) as List;

      var topItems = res.map<TopItem>((e) => TopItem.fromJson(e)).toList();
      _gainers.clear();
      _gainers.addAll(topItems);
      return _gainers;
    } catch (e) {
      throw ApiException(message: e?.message ?? Constants.error_error);
    }
  }

  Future<List<TopItem>> getTopLosers(
      {bool isRefreshRequest = false, int size = 10}) async {
    final url = "$_baseUrl/nots/top-ten/top-loser";

    var time = DateTime.now();
    if (time.hour > 15 || time.hour < 11) {
      isRefreshRequest = false;
    }

    try {
      final res = (await getRequest(
        url: url,
        params: {'all': true, 'size': size},
      )) as List;

      var topItems = res.map<TopItem>((e) => TopItem.fromJson(e)).toList();
      _losers.clear();
      _losers.addAll(topItems);
      return _losers;
    } catch (e) {
      throw ApiException(message: e?.message ?? Constants.error_error);
    }
  }

  Future<List<TopItem>> getTopTurnovers(
      {bool isRefreshRequest = false, int size = 10}) async {
    final url = "$_baseUrl/nots/top-ten/turnover";

    var time = DateTime.now();
    if (time.hour > 15 || time.hour < 11) {
      isRefreshRequest = false;
    }

    try {
      final res = (await getRequest(
        url: url,
        params: {'all': true, 'size': size},
      )) as List;

      var topItems = res.map<TopItem>((e) => TopItem.fromJson(e)).toList();
      _turnovers.clear();
      _turnovers.addAll(topItems);
      return _turnovers;
    } catch (e) {
      throw ApiException(message: e?.message ?? Constants.error_error);
    }
  }

  getSharesTraded() async {}
  getTransactions() async {}
  getBrokers() async {}
}
