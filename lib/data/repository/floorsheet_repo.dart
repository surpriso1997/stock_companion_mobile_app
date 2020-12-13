import 'package:stock_companion/data/provider/api.dart';
import 'package:stock_companion/models/models.dart';
import 'package:stock_companion/utils/custom_exceptions.dart';
import 'package:stock_companion/utils/utils.dart';

class IFloorSheetRepo {
  final String _baseUrl;

  TotalInfo _totalInfo;

  List<Details> _floorSheetList = [];
  List<Details> get floorSheetList => _floorSheetList;
  PageInfo _pageInfo;

  IFloorSheetRepo({String baseUrl}) : _baseUrl = baseUrl;

  int _currentPage = 1;

  getFloorSheetData({
    int size,
    int stockId,
    int buyerId,
    int sellerId,
    String date,
    String stockSymbol,
    bool isRefreshRequest = false,
    bool isLoadMore = false,
  }) async {
    try {
      final url = '$_baseUrl/nots/nepse-data/floorsheet';

      if (isLoadMore) {
        _currentPage += 1;
      }

      var _params = {
        'size': size ?? 30,
        'sort': 'contractId,desc',
        'page': _currentPage
      };
      if (stockId != null) _params['stockId'] = stockId;
      if (buyerId != null) _params['buyerBroker'] = buyerId;
      if (sellerId != null) _params['sellerBroker'] = sellerId;

      final res = await getRequest(url: url, params: _params);

      var _sheetData = res['floorsheets']['content'];
      _totalInfo = TotalInfo.fromJson(res);
      _pageInfo = PageInfo.fromJsons(res['floorsheets']);

      var _data =
          _sheetData.map<Details>((item) => Details.fromJson(item)).toList();

      if (!isLoadMore) {
        _floorSheetList.clear();
      }

      _floorSheetList.addAll(_data);

      return _floorSheetList;
    } catch (e) {
      print(e);
      throw ApiException(message: e.toString() ?? Constants.error_error);
    }
  }
}
