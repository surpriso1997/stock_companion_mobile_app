import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/bloc/index_graph/company_graph.dart';
import 'package:stock_companion/models/company_graph_data_model.dart';
import 'package:stock_companion/utils/data_filter.dart';
import 'package:stock_companion/utils/utils.dart';
import 'package:stock_companion/widgets/fucntional_widgets.dart';
import 'package:stock_companion/widgets/index_graph.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

enum GraphType { Macd, Rsi, Line, Candle }

class CmpanyGraph extends StatefulWidget {
  @override
  _CmpanyGraphState createState() => _CmpanyGraphState();
}

class _CmpanyGraphState extends State<CmpanyGraph> {
  Future<List<CompanyGraphModel>> graphData;

  DurationType _durationType = DurationType.DAY;

  GraphType _graphType = GraphType.Line;

  @override
  void initState() {
    super.initState();
  }

  List _graphs = ["Line", "Macd", "Rsi", "Candle"];

  getIndicators(GraphType type, List<CompanyGraphModel> listItems) {
    switch (type) {
      case GraphType.Macd:
        return <TechnicalIndicators<dynamic, dynamic>>[
          MacdIndicator<dynamic, dynamic>(
              longPeriod: 26, shortPeriod: 12, seriesName: 'HiloOpenClose')
        ];
        break;

      case GraphType.Rsi:
        return <TechnicalIndicators<dynamic, dynamic>>[
          RsiIndicator<dynamic, dynamic>(
              period: 3,
              seriesName: 'HiloOpenClose',
              overbought: 70,
              oversold: 30)
        ];

      default:
        return null;
    }
  }

  getGraphData(GraphType type, List<CompanyGraphModel> listItems) {
    switch (type) {
      case GraphType.Line:
        return <LineSeries<CompanyGraphModel, dynamic>>[
          LineSeries<CompanyGraphModel, dynamic>(
              enableTooltip: true,
              dataSource: listItems,
              yValueMapper: (a, yValue) => a.closePrice,
              xValueMapper: (datum, int index) {
                var date = DateFormat("yyyy MMM dd")
                    .format(DateTime.parse(datum.businessDate));
                var split = date.split(" ");
                return "${split[1]} ${split[2]}\n ${split[0]}";
              },
              xAxisName: "Time",
              yAxisName: "Nepse"),
        ];
        break;

      case GraphType.Macd:
        return <CartesianSeries<CompanyGraphModel, dynamic>>[
          HiloOpenCloseSeries<CompanyGraphModel, dynamic>(
            name: 'HiloOpenClose',
            dataSource: listItems,
            openValueMapper: (item, a) => item.openPrice,
            highValueMapper: (item, a) => item.highPrice,
            lowValueMapper: (item, a) => item.lowPrice,
            closeValueMapper: (item, a) => item.closePrice,
            xValueMapper: (datum, int index) {
              var date = DateFormat("yyyy MMM dd")
                  .format(DateTime.parse(datum.businessDate));
              var split = date.split(" ");
              return "${split[1]} ${split[2]}\n ${split[0]}";
            },
            bullColor: rhoodGreen,
            bearColor: Colors.red.withOpacity(0.6),
            // spacing: 10,
          )
        ];
        break;
      case GraphType.Rsi:
        return <ChartSeries<CompanyGraphModel, dynamic>>[
          HiloOpenCloseSeries<CompanyGraphModel, dynamic>(
            name: 'HiloOpenClose',
            highValueMapper: (item, a) => item.highPrice,
            lowValueMapper: (item, a) => item.lowPrice,
            closeValueMapper: (item, a) => item.closePrice,
            dataSource: listItems,
            openValueMapper: (item, a) => item.openPrice,
            xValueMapper: (datum, int index) {
              var date = DateFormat("yyyy MMM dd")
                  .format(DateTime.parse(datum.businessDate));
              var split = date.split(" ");
              return "${split[1]} ${split[2]}\n ${split[0]}";
            },
          )
        ];
        break;
      case GraphType.Candle:
        return <ChartSeries>[
          CandleSeries<CompanyGraphModel, DateTime>(
            dataSource: listItems,
            xValueMapper: (CompanyGraphModel sales, _) =>
                DateTime.parse(sales.businessDate),
            lowValueMapper: (CompanyGraphModel sales, _) => sales.lowPrice,
            highValueMapper: (CompanyGraphModel sales, _) => sales.highPrice,
            openValueMapper: (CompanyGraphModel sales, _) => sales.openPrice,
            closeValueMapper: (CompanyGraphModel sales, _) => sales.closePrice,
          )
        ];
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    cText({String text, Function onPressed}) {
      return InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
              // color: ,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(color: blackC),
            ),
          ),
        ),
      );
    }

    return BlocBuilder<CompanyGraphBloc, CommonState>(
        builder: (context, state) {
      if (state is FetchingItemsState) {
        return progressIndicator();
      } else if (state is NoDataState) {
        return noDataFound();
      } else if (state is FetchedItemsState) {
        return Column(
          children: [
            SfCartesianChart(
              onZooming: (args) {},
              onZoomStart: (args) {},
              onZoomReset: (args) {},
              onZoomEnd: (args) {},
              zoomPanBehavior: ZoomPanBehavior(
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
                isVisible: true,
              ),
              indicators: getIndicators(_graphType, state.listItems),
              series: getGraphData(_graphType, state.listItems),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                cText(
                    onPressed: () {
                      _graphType = GraphType.Line;
                      setState(() {});
                    },
                    text: "Line"),
                cText(
                    onPressed: () {
                      _graphType = GraphType.Macd;
                      setState(() {});
                    },
                    text: "MACD"),
                cText(
                    onPressed: () {
                      _graphType = GraphType.Candle;
                      setState(() {});
                    },
                    text: "RSI"),
                cText(
                    onPressed: () {
                      _graphType = GraphType.Candle;
                      setState(() {});
                    },
                    text: "Candle"),
                // IconButton(
                //   icon: Icon(Icons.),
                // ),
              ],
            ),
          ],
        );
      } else
        return Container();
    });
  }
}
