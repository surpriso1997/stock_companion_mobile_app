import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/bloc/market_summary/market_indices.bloc.dart';
import 'package:stock_companion/bloc/market_summary/market_subindices.bloc.dart';
import 'package:stock_companion/bloc/market_summary/market_summary_bloc.dart';
import 'package:stock_companion/models/models.dart';
import 'package:stock_companion/pages/market/market.dart';
import 'package:stock_companion/models/sub_index.dart';
import 'package:stock_companion/utils/theme.dart';

class MarketIndices extends StatefulWidget {
  @override
  _MarketIndicesState createState() => _MarketIndicesState();
}

class _MarketIndicesState extends State<MarketIndices> {
  final _labelTextStyle = TextStyle(color: whiteC);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Market Indices"),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            BlocBuilder<MarketIndicesBloc, CommonState>(
              buildWhen: (oldState, newState) {
                if (newState is MIndicesLoading ||
                    newState is MIndicesFetched) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                print(state);

                if (state is FetchingItemsState) {
                  return showLoadingIndicator();
                } else if (state is ErrorState) {
                  return Text(state.message);
                } else if (state is FetchedItemsState) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        showCheckboxColumn: false,
                        columns: [
                          DataColumn(label: Text('Indices')),
                          DataColumn(label: Text('Value')),
                          DataColumn(label: Text("+/-")),
                          DataColumn(label: Text("%")),
                        ],
                        rows: List.generate(state.listItems.length, (index) {
                          NepseIndex item = state.listItems[index];

                          print(item.index);

                          return DataRow(
                              color: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                return item.change == 0.0
                                    ? Colors.white
                                    : item.change > 0
                                        ? Colors.green
                                        : Color(0xffb00000);
                              }),
                              onSelectChanged: (a) {},
                              cells: [
                                DataCell(
                                  Text(item.index, style: _labelTextStyle),
                                ),
                                DataCell(Text(
                                  item.currentValue.toString(),
                                  style: _labelTextStyle,
                                )),
                                DataCell(Text(
                                  item.change.toString(),
                                  style: _labelTextStyle,
                                )),
                                DataCell(Text(
                                  item.perChange.toString(),
                                  style: _labelTextStyle,
                                )),
                              ]);
                        })),
                  );
                } else
                  return Container();
              },
            ),
            SizedBox(height: 30),
            BlocBuilder<MarketSubIndicesBloc, CommonState>(
              builder: (context, state) {
                if (state is MSubIndicesLoading) {
                  return showLoadingIndicator();
                } else if (state is ErrorState) {
                  return Text(state.message);
                } else if (state is FetchedItemsState) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        showCheckboxColumn: false,
                        columns: [
                          DataColumn(label: Text('Indices')),
                          DataColumn(label: Text('Value')),
                          DataColumn(label: Text("+/-")),
                          DataColumn(label: Text("%")),
                        ],
                        rows: List.generate(state.listItems.length, (index) {
                          SubIndex item = state.listItems[index];

                          return DataRow(
                              color: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                return item.change == 0.0
                                    ? Colors.white
                                    : item.change > 0
                                        ? Colors.green
                                        : Color(0xffb00000);
                              }),
                              cells: [
                                DataCell(
                                  SizedBox(
                                    width: 150,
                                    child: Text(item.index,
                                        maxLines: 2, style: _labelTextStyle),
                                  ),
                                ),
                                DataCell(Text(item.currentValue.toString(),
                                    style: _labelTextStyle)),
                                DataCell(Text(
                                  item.change.toString(),
                                  style: _labelTextStyle,
                                )),
                                DataCell(Text(
                                  item.perChange.toString(),
                                  style: _labelTextStyle,
                                )),
                              ]);
                        })),
                  );
                } else
                  return Container();
              },
            ),
          ]),
        ));
  }
}
