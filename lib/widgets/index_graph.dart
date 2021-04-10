import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/index_graph/index_graph_bloc.dart';
import 'package:stock_companion/data/repository/index_graph_repository.dart';
import 'package:stock_companion/pages/pages.dart';
import 'package:stock_companion/utils/data_filter.dart';
import 'package:stock_companion/utils/index_chart_data.dart';
import 'package:stock_companion/widgets/fucntional_widgets.dart';
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
      if (state is FetchingGraph || state is IndexGraphInitial) {
        return progressIndicator();
      } else if (state is FetchedGraph) {
        List<List<num>> data = state.data;

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
            series: <LineSeries<NepseLineGraphData, dynamic>>[
              LineSeries<NepseLineGraphData, dynamic>(
                  enableTooltip: true,
                  dataSource: DataFilter.filterData(state.data, [])
                      .map<NepseLineGraphData>((e) => NepseLineGraphData(
                            // open: e.open,
                            // close: e.close,
                            // low: e.low,
                            // high: e.high,
                            value: e[1],
                            time: e[0],
                          ))
                      .toList(),
                  yValueMapper: (a, yValue) => a.value,
                  xValueMapper: (datum, int index) {
                    return DataFilter.parseDate(datum.time).toString();
                  },
                  xAxisName: "Time",
                  yAxisName: "Nepse"),
            ]);
      } else {
        return Container();
      }
    });
  }
}
