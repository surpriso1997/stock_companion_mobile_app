import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/analysis/analysis_event.dart';
import 'package:stock_companion/bloc/analysis/company_analysis_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/models/analysis/analysis_model.dart';
import 'package:stock_companion/models/analysis/company_analysis_model.dart';
import 'package:stock_companion/models/company_list_model.dart';
import 'package:stock_companion/utils/utils.dart';
import 'package:stock_companion/widgets/fucntional_widgets.dart';

class CompanyAnalysis extends StatefulWidget {
  const CompanyAnalysis({required this.commpanyId, required this.company});
  final int commpanyId;
  final CompanyListModel company;
  @override
  _CompanyAnalysisState createState() => _CompanyAnalysisState();
}

class _CompanyAnalysisState extends State<CompanyAnalysis> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<CompanyAnalysisBloc>(context)
        .add(GetCompanyData(scripSymbol: widget.company.symbol));
  }

  List _tabs = ["Top Buyers", "Top sellers"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.company.companyName)),
      body: BlocBuilder<CompanyAnalysisBloc, CommonState>(
        builder: (context, state) {
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
                List<CompanyAnaylisModel> list =
                    pageViewIndex == 0 ? data[0].buy : data[0].sell;

                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 13),
                      color: pageViewIndex == 0 ? blackC : Colors.red,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          pageViewIndex == 0 ? "Top Buy" : "Top sell",
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
                            headingRowColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.green),
                            headingTextStyle: Theme.of(context)
                                .dataTableTheme
                                .headingTextStyle
                                .copyWith(color: whiteC),
                            columns: [
                              DataColumn(label: Text('Rank')),
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

                              CompanyAnaylisModel _item = list[index];
                              return DataRow(cells: [
                                DataCell(
                                    Text(_item.rank.toString(), style: _style)),
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

            // return Column(
            //   children: [
            //     Flexible(
            //       child: SingleChildScrollView(
            //           child: SingleChildScrollView(
            //         scrollDirection: Axis.horizontal,
            //         child: DataTable(
            //             headingRowColor: MaterialStateProperty.resolveWith(
            //                 (states) => Colors.green),
            //             headingTextStyle: Theme.of(context)
            //                 .dataTableTheme
            //                 .headingTextStyle
            //                 .copyWith(color: whiteC),
            //             columns: [
            //               DataColumn(label: Text('Rank')),
            //               DataColumn(label: Text('Symbol')),
            //               DataColumn(label: Text('Broker')),
            //               DataColumn(label: Text('Qty')),
            //               DataColumn(label: Text('Amount')),
            //               DataColumn(label: Text('Shares\n Traded')),
            //               DataColumn(label: Text('Avg Price')),
            //               DataColumn(label: Text('% of total qty')),
            //             ],
            //             rows: List.generate(
            //                 data[0].buy.length > 20
            //                     ? 20
            //                     : state.listItems.length, (index) {
            //               final _style = TextStyle(color: blackC, fontSize: 16);

            //               CompanyAnaylisModel _item = data[0].buy[index];
            //               return DataRow(cells: [
            //                 DataCell(
            //                     Text(_item.rank.toString(), style: _style)),
            //                 DataCell(Text(_item.scripSymbol.toString(),
            //                     style: _style)),
            //                 DataCell(
            //                     Text(_item.broker.toString(), style: _style)),
            //                 DataCell(
            //                     Text(_item.quantity.toString(), style: _style)),
            //                 DataCell(
            //                     Text(_item.amount.toString(), style: _style)),
            //                 DataCell(Text(_item.sharesTraded.toString(),
            //                     style: _style)),
            //                 DataCell(Text(_item.averagePrice.toString(),
            //                     style: _style)),
            //                 DataCell(Text(_item.percentOfTotalQty.toString(),
            //                     style: _style)),
            //               ]);
            //             })),
            //       )),
            //     ),
            //   ],
            // );

          } else {
            return Container();
          }
        },
      ),
    );
  }
}
