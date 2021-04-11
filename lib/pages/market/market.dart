import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/index_graph/index_graph_bloc.dart';
import 'package:stock_companion/bloc/market_summary/market_indices.bloc.dart';
import 'package:stock_companion/bloc/market_summary/market_subindices.bloc.dart';
import 'package:stock_companion/bloc/market_summary/market_summary_bloc.dart';
import 'package:stock_companion/utils/utils.dart';
import 'package:stock_companion/widgets/index_graph.dart';

class Market extends StatefulWidget {
  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<MarketIndicesBloc>(context).add(FetchItems());
    BlocProvider.of<MarketSubIndicesBloc>(context).add(FetchItems());
    BlocProvider.of<IndexGraphBloc>(context).add(GetGraph(index: 58));
    BlocProvider.of<MarketSummaryCubit>(context).add(FetchNepseIndices());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.primaryColor;
    final textSelctionColor = theme.textSelectionColor;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: Text("Stock Companion",
              style: TextStyle(color: textSelctionColor))),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            BlocBuilder<MarketSummaryCubit, MarketSummaryState>(
              buildWhen: (o, n) =>
                  (n is MIndicesLoading || n is MIndicesFetched),
              builder: (context, state) {
                if (state is MIndicesLoading)
                  return Text("Stock Companion",
                      style: TextStyle(color: textSelctionColor));
                else if (state is MIndicesFetched) {
                  var nepse = state.index[3];
                  var indexValue = nepse.currentValue;
                  var change = nepse.change;
                  var per = nepse.perChange;
                  var color = (nepse.change < 0)
                      ? Colors.red.withOpacity(0.5)
                      : rhoodGreen.withOpacity(0.7);

                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("NEPSE: $indexValue",
                            style: TextStyle(color: blackC, fontSize: 20)),
                        Text("$change($per%)",
                            style: TextStyle(
                                color: blackC,
                                fontSize: 20,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  );
                } else
                  return Text("Stock Companion",
                      style: TextStyle(color: textSelctionColor));
              },
            ),
            SizedBox(height: 10),
            Container(
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
