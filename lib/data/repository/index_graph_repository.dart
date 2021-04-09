import 'package:stock_companion/data/provider/api.dart';

class IIndexGraphRepository {
  IIndexGraphRepository({String baseUrl}) : _baseUrl = baseUrl;

  final String _baseUrl;

  List _chartData = [];
  List get chartData => _chartData;
  IndexData _indexData;
  IndexData get indexData => _indexData;

  getIndexChartData({var duration, int indexId = 58}) async {
    var url = _baseUrl + "graph/index/$indexId";

    try {
      List res = getRequest(url: url);

      if (res.isNotEmpty) {
        var data = IndexData.line(res);
        // _chartData = data;

        _indexData = data;
        return res;
        // return data;
      }
    } catch (e) {
      return [];
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
  final List<TimeStampIndex> data;

  const IndexData({this.data});

  factory IndexData.line(List<List<dynamic>> list) {
    return IndexData(
        data: list
            .map<TimeStampIndex>((e) => TimeStampIndex.fromList(e))
            .toList());
  }
}
