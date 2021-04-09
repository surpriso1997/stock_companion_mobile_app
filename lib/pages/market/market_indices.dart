import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/market_summary/market_summary_bloc.dart';
import 'package:stock_companion/models/models.dart';
import 'package:stock_companion/pages/market/market.dart';
import 'package:stock_companion/models/sub_index.dart';

class MarketIndices extends StatefulWidget {
  @override
  _MarketIndicesState createState() => _MarketIndicesState();
}

class _MarketIndicesState extends State<MarketIndices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Market Indices"),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            BlocBuilder<MarketSummaryCubit, MarketSummaryState>(
              buildWhen: (oldState, newState) {
                if (newState is MIndicesLoading ||
                    newState is MIndicesFetched) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                print(state);

                if (state is MIndicesLoading) {
                  return showLoadingIndicator();
                } else if (state is MIndicesError) {
                  return Text(state.error);
                } else if (state is MIndicesFetched) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        columns: [
                          DataColumn(label: Text('Indices')),
                          DataColumn(label: Text('Value')),
                          DataColumn(label: Text("+/-")),
                          DataColumn(label: Text("%")),
                        ],
                        rows: List.generate(state.index.length, (index) {
                          NepseIndex item = state.index[index];

                          print(item.index);

                          return DataRow(cells: [
                            DataCell(Text(item.index)),
                            DataCell(Text(item.currentValue.toString())),
                            DataCell(Text(item.change.toString())),
                            DataCell(Text(item.perChange.toString())),
                          ]);
                        })),
                  );
                } else
                  return Container();
              },
            ),
            SizedBox(height: 30),
            BlocBuilder<MarketSummaryCubit, MarketSummaryState>(
              buildWhen: (newState, oldState) {
                if (newState is MSubIndicesFetched ||
                    newState is MSubIndicesLoading) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                if (state is MSubIndicesLoading) {
                  return showLoadingIndicator();
                } else if (state is MSubIndicesError) {
                  return Text(state.error);
                } else if (state is MSubIndicesFetched) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        columns: [
                          DataColumn(label: Text('Indices')),
                          DataColumn(label: Text('Value')),
                          DataColumn(label: Text("+/-")),
                          DataColumn(label: Text("%")),
                        ],
                        rows: List.generate(state.subIndices.length, (index) {
                          SubIndex item = state.subIndices[index];

                          return DataRow(cells: [
                            DataCell(Text(item.index)),
                            DataCell(Text(item.currentValue.toString())),
                            DataCell(Text(item.change.toString())),
                            DataCell(Text(item.perChange.toString())),
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
