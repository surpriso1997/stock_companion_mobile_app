import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/analysis/analysis_event.dart';
import 'package:stock_companion/bloc/analysis/broker_analysis_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/models/analysis/analysis_model.dart';
import 'package:stock_companion/models/analysis/broker_analysis_model.dart';
import 'package:stock_companion/models/analysis/company_analysis_model.dart';
import 'package:stock_companion/models/brokers.model.dart';
import 'package:stock_companion/utils/theme.dart';

import 'fucntional_widgets.dart';

class BrokerAnalysis extends StatefulWidget {
  BrokerAnalysis({required this.brokerId, required this.broker});
  final int brokerId;
  final BrokersModel broker;
  @override
  _BrokerAnalysisState createState() => _BrokerAnalysisState();
}

class _BrokerAnalysisState extends State<BrokerAnalysis> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<BrokerAnalysisBloc>(context)
        .add(GetBrokerData(brokerId: int.tryParse(widget.broker.memberCode)));
  }

  @override
  Widget build(BuildContext context) {
    List _tabs = ["Top Buy ", "Top Sell"];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.broker.memberName,
        ),
      ),
      body: SafeArea(
        top: true,
        child: BlocBuilder<BrokerAnalysisBloc, CommonState>(
          builder: (context, state) {
            print(state.toString());
            if (state is FetchingItemsState) {
              return progressIndicator();
            } else if (state is ErrorState) {
              return Center(
                child: Text(
                  "An error occrred",
                  style: TextStyle(color: blackC),
                ),
              );
            } else if (state is FetchedItemsState) {
              List<AnalysisModel> data = state.listItems;

              return PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _tabs.length,
                onPageChanged: (a) {},
                itemBuilder: (context, pageViewIndex) {
                  List<BrokerAnalysisModel> list =
                      pageViewIndex == 0 ? data[0].buy : data[0].sell;

                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 13),
                        color: pageViewIndex == 0 ? blackC : Colors.red,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            _tabs[pageViewIndex],
                            // pageViewIndex == 0 ?  : "Top sell",
                            style: TextStyle(
                              fontWeight: bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: SingleChildScrollView(
                            child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                              headingRowColor:
                                  MaterialStateProperty.resolveWith(
                                      (states) => Colors.green),
                              headingTextStyle: Theme.of(context)
                                  .dataTableTheme
                                  .headingTextStyle
                                  .copyWith(color: whiteC),
                              columns: [
                                DataColumn(label: Text('Rank')),
                                DataColumn(label: Text('Symbol')),
                                DataColumn(label: Text('Broker')),
                                DataColumn(label: Text('Qty')),
                                DataColumn(label: Text('Amount')),
                                DataColumn(label: Text('Shares\n Traded')),
                                DataColumn(label: Text('Avg Price')),
                                DataColumn(label: Text('% of total qty')),
                              ],
                              rows: List.generate(
                                  list.length > 20 ? 20 : list.length, (index) {
                                final _style =
                                    TextStyle(color: blackC, fontSize: 16);

                                BrokerAnalysisModel _item = list[index];
                                return DataRow(cells: [
                                  DataCell(Text(_item.rank.toString(),
                                      style: _style)),
                                  DataCell(Text(_item.scripSymbol.toString(),
                                      style: _style)),
                                  DataCell(Text(_item.broker.toString(),
                                      style: _style)),
                                  DataCell(Text(_item.quantity.toString(),
                                      style: _style)),
                                  DataCell(Text(_item.amount.toString(),
                                      style: _style)),
                                  DataCell(Text(_item.sharesTraded.toString(),
                                      style: _style)),
                                  DataCell(Text(_item.averagePrice.toString(),
                                      style: _style)),
                                  DataCell(Text(
                                      _item.percentOfTotalQty.toString(),
                                      style: _style)),
                                ]);
                              })),
                        )),
                      ),
                    ],
                  );
                },
              );
            } else
              return Container();
          },
        ),
      ),
    );
  }
}
