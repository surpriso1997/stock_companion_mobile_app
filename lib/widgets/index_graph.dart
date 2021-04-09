import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/index_graph/index_graph_bloc.dart';
import 'package:stock_companion/pages/pages.dart';
import 'package:stock_companion/utils/data_filter.dart';
import 'package:stock_companion/utils/index_chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IndexGraph extends StatefulWidget {
  @override
  _IndexGraphState createState() => _IndexGraphState();
}

class _IndexGraphState extends State<IndexGraph> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexGraphBloc, IndexGraphState>(
        builder: (context, state) {
      return SfCartesianChart(
          onZooming: (args) {},
          onZoomStart: (args) {},
          onZoomReset: (args) {},
          onZoomEnd: (args) {},
          zoomPanBehavior: ZoomPanBehavior(
            enableDoubleTapZooming: false,
            maximumZoomLevel: 1,
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
          ]);
    });
  }
}
