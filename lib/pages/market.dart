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
    final theme = Theme.of(context);
    final primaryColor = theme.primaryColor;

    _buildTableRow(
        {String title,
        String value,
        String diff,
        String per,
        Color backgrounColor,
        Color textColor}) {
      return Container(
        height: 40,
        color: backgrounColor,
        child: Row(
          children: [
            SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: TextStyle(color: textColor, fontSize: 16),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(value, style: TextStyle(color: textColor, fontSize: 18)),
                  Text(diff, style: TextStyle(color: textColor, fontSize: 18)),
                  Text(per, style: TextStyle(color: textColor, fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "NEPSE: 1115.11",
              style: TextStyle(color: Theme.of(context).textSelectionColor),
            ),
            Text(
              "-10(2.8%)",
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Nepse"),
                Text("Daily"),
              ],
            ),
            SizedBox(height: 10),
            SfCartesianChart(
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
                          .map<IndexData>((e) =>
                              IndexData(indexValue: e[1], timestamp: e[0]))
                          .toList(),
                      yValueMapper: (a, yValue) => a.indexValue,
                      xValueMapper: (datum, int index) {
                        return DataFilter.parseDate(datum.timestamp).toString();
                      },
                      xAxisName: "Time",
                      yAxisName: "Nepse"),
                ]),
            Row(
              children: [Icon(Icons.fullscreen), Icon(Icons.bar_chart)],
            ),

            //maket indices

            Column(
              children: [
                _buildTableRow(
                    title: "Indices",
                    value: "Value",
                    diff: "+/-",
                    per: "%",
                    backgrounColor: primaryColor,
                    textColor: theme.textSelectionColor),
                Column(children: [
                  ...List.generate(2, (index) {
                    return _buildTableRow(
                        title: "ADBL",
                        value: "490",
                        diff: "10",
                        per: "2%",
                        backgrounColor: Colors.green,
                        textColor: Colors.white);
                  }),
                  ...List.generate(2, (index) {
                    return _buildTableRow(
                        title: "ADBL",
                        value: "1132",
                        diff: "10",
                        per: "2%",
                        backgrounColor: Colors.red,
                        textColor: Colors.white);
                  }),
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
