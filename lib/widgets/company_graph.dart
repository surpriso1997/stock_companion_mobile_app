import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/bloc/index_graph/company_graph.dart';
import 'package:stock_companion/models/company_graph_data_model.dart';
import 'package:stock_companion/utils/data_filter.dart';
import 'package:stock_companion/widgets/fucntional_widgets.dart';
import 'package:stock_companion/widgets/index_graph.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CmpanyGraph extends StatefulWidget {
  @override
  _CmpanyGraphState createState() => _CmpanyGraphState();
}

class _CmpanyGraphState extends State<CmpanyGraph> {
  Future<List<CompanyGraphModel>> graphData;

  DurationType _durationType = DurationType.DAY;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyGraphBloc, CommonState>(
        builder: (context, state) {
      if (state is FetchingItemsState) {
        return progressIndicator();
      } else if (state is NoDataState) {
        return noDataFound();
      } else if (state is FetchedItemsState) {
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
            series: <LineSeries<CompanyGraphModel, dynamic>>[
              LineSeries<CompanyGraphModel, dynamic>(
                  enableTooltip: true,
                  dataSource: state.listItems,
                  yValueMapper: (a, yValue) => a.closePrice,
                  xValueMapper: (datum, int index) {
                    return DateFormat("yyyy MMM dd")
                        .format(DateTime.parse(datum.businessDate));
                  },
                  xAxisName: "Time",
                  yAxisName: "Nepse"),
            ]);
      }
    });
  }
}
