import 'package:stock_companion/data/provider/api.dart';
import 'package:stock_companion/models/brokers.model.dart';
import 'package:stock_companion/utils/utils.dart';

class IBrokerRepository {
  IBrokerRepository({String baseUrl}) : _baseUrl = baseUrl;

  final String _baseUrl;
  List<BrokersModel> _brokers = [];
  List<BrokersModel> get brokers => _brokers;

  getBrokers({bool isRefreshRequest = false}) async {
    var url = _baseUrl + "nots/member";

    try {
      var res = getRequest(url: url);

      var data = res['content'] as List;

      _brokers.clear();
      _brokers =
          data.map<BrokersModel>((e) => BrokersModel.fromJson(e)).toList();
    } catch (e) {
      throw ApiException(message: "Error occurred");
    }
  }
}
