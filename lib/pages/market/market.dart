import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/index_graph/index_graph_bloc.dart';
import 'package:stock_companion/bloc/market_summary/market_summary_bloc.dart';
import 'package:stock_companion/widgets/index_graph.dart';
import '../../utils/utils.dart';

class Market extends StatefulWidget {
  @override
  _MarketState createState() => _MarketState();
}

// class IndexData {
//   final int timestamp;
//   final double indexValue;
//   const IndexData({this.timestamp, this.indexValue});
// }

class _MarketState extends State<Market> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<MarketSummaryCubit>(context).add(FetchNepseIndices());
    BlocProvider.of<MarketSummaryCubit>(context).add(FetchSubIndices());

    Timer(Duration(seconds: 8), () {
      BlocProvider.of<IndexGraphBloc>(context).add(GetGraph(index: 58));
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.primaryColor;
    final textSelctionColor = theme.textSelectionColor;

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

            // Container(
            //   height: 10,
            //   width: 500,
            //   child: WebView(
            //       javascriptMode: JavascriptMode.unrestricted,
            //       initialUrl: "https://www.nepsealpha.com/trading/chart"),
            // ),

            SizedBox(height: 20),
            //maket indices
            Container(
              // color: Colors.red,
              height: 350,
              child: IndexGraph(),
            )
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
