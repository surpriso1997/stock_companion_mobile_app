import 'package:flutter/foundation.dart';
import 'package:stock_companion/data/provider/api.dart';
import 'package:stock_companion/models/index_history.dart';
import 'package:stock_companion/utils/utils.dart';

class IIndexGraphRepository {
  IIndexGraphRepository({String baseUrl}) : _baseUrl = baseUrl;

  final String _baseUrl;

  List<List<num>> _chartData = [];
  List<List<num>> get chartData => _chartData;

  var _indexData;
  get indexData => _indexData;

  getIndexChartData({
    var duration,
    String indexType = Constants.NEPSE,
    String from,
    String to,
    int indexId = 58,
  }) async {
    var url = _baseUrl + "/nots/graph/index";

    if (from == null) {
      //for nepse alpha
      // from =
      //     DateTime.now().subtract(Duration(days: 365)).millisecondsSinceEpoch;
      // from = (from / 1000).floor();
    }
    if (to == null) {
      // for nepse alpha
      // to = DateTime.now().millisecondsSinceEpoch;
      // to = (to / 1000).floor();
    }

    // var url =
    //     "https://nepsealpha.com/trading/1/history?symbol=$indexData&resoluion=1D&from=$from&to=$to";

    Map<String, dynamic> params = {
      /// the recent date of format 2021-04-10
      "endDate": to,

      /// the older date
      "startDate": from
    };

    if (from != null || to != null) {
      params['indexCode'] = indexId;
    } else {
      url = url + "/$indexId";
    }

    ///NEPSSE ALPHA params
    // var params = {
    //   "symbol": indexType,
    //   "resolution": "1D",
    //   "from": (from / 1000).floor(),
    //   "to": (to / 1000).floor()
    // };
    print(params);

    try {
      List res = await getRequest(
        url: url,
        params: params,
      );
      print(res.toString());

      if (res.isNotEmpty) {
        // IndexData _tempData = IndexData.fromJson(res);

        ///TODO: for nepse alpha data
        // for (int i = 0; i < _tempData.time.length; i++) {
        //   List<num> _data = [
        //     _tempData.time[i],
        //     _tempData.open[i],
        //     _tempData.close[i],
        //     _tempData.low[i],
        //     _tempData.high[i],
        //     _tempData.value[i],
        //   ];
        //   data.add(_data);
        // }
        //
        _chartData.clear();
        _chartData = res.map<List<num>>((e) {
          List<num> _a = [];

          _a.add(e[0]);
          _a.add(e[1]);

          _chartData.add(_a);
          return _a;
        }).toList();

        return _chartData;
      }
    } catch (e) {
      throw ApiException(message: e?.toString());
    }
  }

  convertIndexDataToCandle() {}
}

class TimeStampIndex {
  final time;
  final index;
  const TimeStampIndex({required this.time, required this.index});
  factory TimeStampIndex.fromList(List list) {
    return TimeStampIndex(time: list[0], index: list[1]);
  }
}

class IndexData {
  final List<num> time;
  final List<num> open;
  final List<num> high;
  final List<num> low;
  final List<num> close;
  final List<num> value;

  const IndexData(
      {required this.time,
      required this.open,
      required this.high,
      required this.low,
      required this.close,
      required this.value});

  factory IndexData.fromJson(Map json) {
    return IndexData(
        close: json['c'],
        open: json['o'],
        high: json['h'],
        low: json['l'],
        value: json['v']);
  }
}

class LineGraphData {
  final num open;
  final num close;
  final num high;
  final num low;
  final num value;
  final num time;

  const LineGraphData(
      {@required required this.open,
      @required required this.close,
      @required required this.low,
      @required required this.high,
      @required required this.value,
      @required required this.time});
}

class NepseLineGraphData {
  final num value;
  final num time;

  const NepseLineGraphData({required this.value, required this.time});
}
