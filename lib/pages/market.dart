import 'package:flutter/material.dart';
import 'package:stock_companion/utils/index_chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../utils/utils.dart';

class Market extends StatefulWidget {
  @override
  _MarketState createState() => _MarketState();
}

class IndexData {
  final int timestamp;
  final double indexValue;
  const IndexData({this.timestamp, this.indexValue});
}

class _MarketState extends State<Market> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        top: true,
        child: SfCartesianChart(
            onZooming: (args) {},
            onZoomStart: (args) {},
            onZoomReset: (args) {},
            onZoomEnd: (args) {},
            zoomPanBehavior: ZoomPanBehavior(
              enableDoubleTapZooming: false,
              maximumZoomLevel: 1,
              // TODO: to decide if pannig should be true or not
              enablePanning: true,
              enablePinching: true,
            ),
            trackballBehavior: TrackballBehavior(
                shouldAlwaysShow: true,
                enable: true,
                markerSettings: TrackballMarkerSettings(color: Colors.pink),
                activationMode: ActivationMode.singleTap,
                lineType: TrackballLineType.vertical),
            primaryXAxis: CategoryAxis(),
            series: <LineSeries<IndexData, dynamic>>[
              LineSeries<IndexData, dynamic>(
                  enableTooltip: true,
                  dataSource: DataFilter.filterData(index_data, [])
                      .map<IndexData>(
                          (e) => IndexData(indexValue: e[1], timestamp: e[0]))
                      .toList(),
                  yValueMapper: (a, yValue) => a.indexValue,
                  xValueMapper: (datum, int index) {
                    return DataFilter.parseDate(datum.timestamp).toString();
                  },
                  xAxisName: "Time",
                  yAxisName: "Nepse"),
            ]),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
