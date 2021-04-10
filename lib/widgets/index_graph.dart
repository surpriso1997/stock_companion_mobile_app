import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/index_graph/index_graph_bloc.dart';
import 'package:stock_companion/data/repository/index_graph_repository.dart';
import 'package:stock_companion/utils/data_filter.dart';
import 'package:stock_companion/utils/util_functions.dart';
import 'package:stock_companion/utils/utils.dart';
import 'package:stock_companion/widgets/fucntional_widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IndexGraph extends StatefulWidget {
  @override
  _IndexGraphState createState() => _IndexGraphState();
}

enum DurationType { DAY, WEEK, MONTH, YEAR, MAX }

class _IndexGraphState extends State<IndexGraph> {
  DurationType _durationType = DurationType.DAY;

  @override
  Widget build(BuildContext context) {
    clickableText(String text, Function onPressed) {
      return InkWell(
          onTap: onPressed, child: Text(text, style: TextStyle(color: blackC)));
    }

    return Column(
      children: [
        BlocBuilder<IndexGraphBloc, IndexGraphState>(builder: (context, state) {
          if (state is FetchingGraph || state is IndexGraphInitial) {
            return Container(
              height: 300,
              alignment: Alignment.center,
              child: progressIndicator(),
            );
          } else if (state is FetchedGraph) {
            // List<List<num>> data = state.data;
            var dataSource = state.data
                // DataFilter.filterData(state.data, [])
                .map<NepseLineGraphData>((e) => NepseLineGraphData(
                      // open: e.open,
                      // close: e.close,
                      // low: e.low,
                      // high: e.high,
                      value: e[1],
                      time: e[0],
                    ))
                .toList();

            return SfCartesianChart(
                onZooming: (args) {},
                onZoomStart: (args) {},
                onZoomReset: (args) {},
                onZoomEnd: (args) {},
                zoomPanBehavior: ZoomPanBehavior(
                  // enableDoubleTapZooming: true,
                  maximumZoomLevel: 5,
                  enablePanning: true,
                  enablePinching: true,
                ),
                trackballBehavior: TrackballBehavior(
                    shouldAlwaysShow: true,
                    enable: true,
                    markerSettings: TrackballMarkerSettings(color: Colors.pink),
                    activationMode: ActivationMode.singleTap,
                    lineType: TrackballLineType.vertical),
                primaryXAxis: CategoryAxis(
                    // maximumLabels: 2, desiredIntervals: 10,

                    // ma
                    ),
                series: <LineSeries<NepseLineGraphData, dynamic>>[
                  LineSeries<NepseLineGraphData, dynamic>(
                      enableTooltip: true,
                      dataSource: dataSource,
                      yValueMapper: (a, yValue) => a.value,
                      xValueMapper: (datum, int index) {
                        return DataFilter.parseDate(datum.time,
                                durationType: _durationType)
                            .toString();
                      },
                      xAxisName: "Time",
                      yAxisName: "Nepse"),
                ]);
          } else {
            return Container();
          }
        }),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  clickableText("1D", () {
                    BlocProvider.of<IndexGraphBloc>(context)
                        .add(GetGraph(index: 58));
                    _durationType = DurationType.DAY;
                  }),
                  clickableText("1W", () {
                    BlocProvider.of<IndexGraphBloc>(context).add(GetGraph(
                      index: 58,
                      startDate: formatDate(DateTime.now()),
                      endDate: formatDate(
                          DateTime.now().subtract(Duration(days: 7))),
                    ));
                    _durationType = DurationType.WEEK;
                  }),
                  clickableText("1M", () {
                    BlocProvider.of<IndexGraphBloc>(context).add(
                      GetGraph(
                        index: 58,
                        startDate: formatDate(DateTime.now()),
                        endDate: formatDate(
                            DateTime.now().subtract(Duration(days: 30))),
                      ),
                    );
                    _durationType = DurationType.MONTH;
                  }),
                  clickableText("1y", () {
                    BlocProvider.of<IndexGraphBloc>(context).add(GetGraph(
                      index: 58,
                      startDate: formatDate(DateTime.now()),
                      endDate: formatDate(
                          DateTime.now().subtract(Duration(days: 365))),
                    ));
                    _durationType = DurationType.YEAR;
                  }),
                  clickableText("MAX", () {
                    BlocProvider.of<IndexGraphBloc>(context).add(GetGraph(
                      index: 58,
                      startDate: formatDate(DateTime.now()),
                      endDate: formatDate(DateTime.parse("2001-09-11")),
                    ));
                    _durationType = DurationType.MAX;
                  }),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.fullscreen),
                  SizedBox(width: 10),
                  Icon(Icons.bar_chart),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
