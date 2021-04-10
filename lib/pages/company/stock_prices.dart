import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/bloc/stock_price/stock_price.dart';
import 'package:stock_companion/models/models.dart';
import 'package:stock_companion/utils/utils.dart';
import 'package:stock_companion/widgets/fucntional_widgets.dart';

import 'company_details.dart';

class StockPrices extends StatefulWidget {
  @override
  _StockPricesState createState() => _StockPricesState();
}

class _StockPricesState extends State<StockPrices> {
  ScrollController _controller;
  bool _isPaginateLoading = false;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<StockPriceBloc>(context).add(FetchItems());

    _controller = ScrollController()
      ..addListener(() {
        var _position = _controller.position;
        if (_controller.offset >= _position.maxScrollExtent &&
            !_position.outOfRange) {
          BlocProvider.of<StockPriceBloc>(context).add(FetchMoreItems());
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stock Prices"),
        actions: [
          IconButton(icon: Icon(Icons.search, color: whiteC), onPressed: () {})
        ],
      ),
      body: BlocListener<StockPriceBloc, CommonState>(
        listener: (context, state) {
          if (state is FetchingMoreItemsState) {
            _isPaginateLoading = true;
            setState(() {});
          } else {
            _isPaginateLoading = false;
            setState(() {});
          }
        },
        child: BlocBuilder<StockPriceBloc, CommonState>(
          builder: (context, state) {
            if (state is FetchingItemsState) {
              return progressIndicator();
            } else if (state is ErrorState) {
              return errorWidget(state.message, () {});
            } else if (state is NoDataState) {
              return noDataFound();
            } else if (state is FetchingMoreItemsState ||
                state is FetchedItemsState) {
              print(state);
              return Column(
                children: [
                  Flexible(
                    child: SingleChildScrollView(
                        controller: _controller,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                              showCheckboxColumn: false,
                              headingRowColor:
                                  MaterialStateProperty.resolveWith(
                                      (states) => Colors.black),
                              headingTextStyle: Theme.of(context)
                                  .dataTableTheme
                                  .headingTextStyle
                                  .copyWith(color: whiteC),
                              columns: [
                                DataColumn(label: Text('SY')),
                                DataColumn(label: Text('Open')),
                                DataColumn(label: Text('High')),
                                DataColumn(label: Text('Low')),
                                DataColumn(label: Text('Close')),
                                DataColumn(label: Text('P Close')),
                                DataColumn(label: Text('Traded Qty')),
                                DataColumn(label: Text('52w HIgh')),
                                DataColumn(label: Text('52w Low')),
                              ],
                              rows: List.generate(state.listItems.length,
                                  (index) {
                                StockPrice _item = state.listItems[index];
                                final _style =
                                    TextStyle(color: whiteC, fontSize: 16);

                                return DataRow(
                                  color:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    return _item.closePrice ==
                                            _item.previousDayClosePrice
                                        ? Colors.grey
                                        : _item.closePrice >
                                                _item.previousDayClosePrice
                                            ? Colors.green
                                            : Color(0xffb00000);
                                  }),
                                  onSelectChanged: (a) {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (_) => CompanyDetails(
                                                  company: _item
                                                      .gCompanyFromStockPrice(),
                                                )));
                                  },
                                  cells: [
                                    DataCell(Text(_item.symbol,
                                        style: _style.copyWith(
                                            fontWeight: FontWeight.bold))),
                                    DataCell(Text(_item.openPrice.toString(),
                                        style: _style)),
                                    DataCell(Text(_item.highPrice.toString(),
                                        style: _style)),
                                    DataCell(Text(_item.lowPrice.toString(),
                                        style: _style)),
                                    DataCell(Text(_item.closePrice.toString(),
                                        style: _style)),
                                    DataCell(Text(
                                        _item.previousDayClosePrice.toString(),
                                        style: _style)),
                                    DataCell(Text(
                                        _item.totalTradedQuantity.toString(),
                                        style: _style)),
                                    DataCell(Text(
                                        _item.fiftyTwoWeekHigh.toString(),
                                        style: _style)),
                                    DataCell(Text(
                                        _item.fiftyTwoWeekLow.toString(),
                                        style: _style)),
                                  ],
                                );
                              })),
                        )),
                  ),
                  if (_isPaginateLoading) progressIndicator()
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
