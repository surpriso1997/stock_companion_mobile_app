import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/market_summary/market_summary_bloc.dart';
import 'package:stock_companion/utils/index_chart_data.dart';
import 'package:stock_companion/utils/util_functions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../utils/utils.dart';

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
  void initState() {
    super.initState();
    BlocProvider.of<MarketSummaryCubit>(context).add(FetchNepseIndices());
    BlocProvider.of<MarketSummaryCubit>(context).add(FetchSubIndices());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.primaryColor;
    final textSelctionColor = theme.textSelectionColor;

    _buildTableRowTitle(
        {String title,
        String value,
        String diff,
        String per,
        Color bgColor,
        Color textColor,
        ThemeData theme,
        bool isTableHeading}) {
      var headingStyle = theme.dataTableTheme.headingTextStyle;

      return Container(
        height: 40,

        // TODO: to fix the theme of the heading
        color: MediaQuery.of(context).platformBrightness == Brightness.dark
            ? whiteC
            : bgColor,
        child: Row(
          children: [
            SizedBox(width: 10),
            Expanded(
              child: Text(title, style: headingStyle),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(value, style: headingStyle),
                  Text(diff, style: headingStyle),
                  Text(per, style: headingStyle),
                ],
              ),
            ),
          ],
        ),
      );
    }

    _buildTableRowCell(
        {String title,
        double value,
        double diff,
        double per,
        Color bgColor,
        ThemeData theme,
        bool isTableHeading}) {
      bgColor = (diff < 0) ? Color(0xffFF0909) : Color(0xff21F595);

      if (per == 0.0) bgColor = whiteC;

      final _textColor = theme.dataTableTheme.headingTextStyle.copyWith(
        color: bgColor,
        fontWeight: FontWeight.normal,
      );

      return Container(
        height: 40,
        color: Color(0xff2A2c2c),
        child: Row(
          children: [
            SizedBox(width: 10),
            Expanded(
              child: Text(processIndexTitle(title), style: _textColor),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(value.toString(), style: _textColor),
                  Text(diff.toString(),
                      style: _textColor.copyWith(
                          fontWeight: FontWeight.bold, color: bgColor)),
                  Text(
                    per.toString(),
                    style: _textColor.copyWith(
                        fontWeight: FontWeight.bold, color: bgColor),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    clickableText(String text, Function onPressed) {
      return InkWell(
          onTap: onPressed, child: Text(text, style: TextStyle(color: blackC)));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: false,
        title: BlocBuilder<MarketSummaryCubit, MarketSummaryState>(
          buildWhen: (o, n) => (n is MIndicesLoading || n is MIndicesFetched),
          builder: (context, state) {
            if (state is MIndicesLoading)
              return Text("Nepal Stock",
                  style: TextStyle(color: textSelctionColor));
            else if (state is MIndicesFetched) {
              var nepse = state.index[3];
              var indexValue = nepse.currentValue;
              var change = nepse.change;
              var per = nepse.perChange;
              var color = (nepse.change < 0) ? Colors.red : Colors.green;

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("NEPSE: $indexValue",
                      style: TextStyle(
                          color: Theme.of(context).textSelectionColor)),
                  Text("$change($per%)", style: TextStyle(color: color))
                ],
              );
            } else
              return Text(
                "Nepal Stock",
                style: TextStyle(color: textSelctionColor),
              );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Nepse"),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      clickableText("1D", () {}),
                      clickableText("1W", () {}),
                      clickableText("1M", () {}),
                      clickableText("1y", () {}),
                      clickableText("MAX", () {}),
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
            SizedBox(height: 20),
            //maket indices
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

showLoadingIndicator() {
  return CircularProgressIndicator(
    strokeWidth: 0.98,
    valueColor: AlwaysStoppedAnimation(Colors.blue),
  );
}
