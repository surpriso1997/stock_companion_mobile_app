import 'package:flutter/foundation.dart';
import 'package:stock_companion/data/provider/api.dart';
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
    int from,
    int to,
    int indexId = 58,
  }) async {
    var url = _baseUrl + "/nots/graph/index/$indexId";

    if (from == null) {
      from =
          DateTime.now().subtract(Duration(days: 365)).millisecondsSinceEpoch;
      from = (from / 1000).floor();
    }
    if (to == null) {
      to = DateTime.now().millisecondsSinceEpoch;
      to = (to / 1000).floor();
    }

    // var url =
    //     "https://nepsealpha.com/trading/1/history?symbol=$indexData&resoluion=1D&from=$from&to=$to";

    var params = {
      "symbol": indexType,
      "resolution": "1D",
      "from": (from / 1000).floor(),
      "to": (to / 1000).floor()
    };
    print(params);

    try {
      List res = await getRequest(
        url: url,
        // params: params,
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
  const TimeStampIndex({this.time, this.index});
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
      {this.time, this.open, this.high, this.low, this.close, this.value});

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
      {@required this.open,
      @required this.close,
      @required this.low,
      @required this.high,
      @required this.value,
      @required this.time});
}

class NepseLineGraphData {
  final num value;
  final num time;

  const NepseLineGraphData({this.value, this.time});
}
