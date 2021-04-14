import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:stock_companion/bloc/market_depth/bloc/market_depth_bloc.dart';
import 'package:stock_companion/models/market_depth/market_depth.dart';
import 'package:stock_companion/utils/utils.dart';
import 'package:stock_companion/widgets/fucntional_widgets.dart';

class MarketDepth extends StatefulWidget {
  final int companyId;

  const MarketDepth({this.companyId});

  @override
  _MarketDepthState createState() => _MarketDepthState();
}

class _MarketDepthState extends State<MarketDepth> {
  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // if (widget.companyId != null) {
    BlocProvider.of<MarketDepthBloc>(context)
        .add(GetMarketDepth(widget.companyId));
    // }
  }

  @override
  void dispose() {
    super.dispose();

    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Market Depth")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Company Name"),
            Container(
              // color: Colors.pink,
              height: 500,
              child: BlocBuilder<MarketDepthBloc, MarketDepthState>(
                builder: (context, state) {
                  print(state);
                  if (state is MarketDepthInitial ||
                      state is MarketDepthLoading) {
                    return progressIndicator();
                  } else if (state is MarketClosedState) {
                    var date = DateTime.now().toLocal();
                    var _format = DateFormat("yyyy-MM-dd").format(date);

                    var _eleven = "$_format 11:00:00";
                    var _three = "$_format 03:00:00";

                    var _e = DateTime.parse(_eleven);

                    var _t = DateTime.parse(_three);

                    bool _after = date.isAfter(_e);
                    bool _before = date.isBefore(_t);

                    bool _isMarketOpen = _after && _before;

                    var _date = DateFormat(DateFormat.HOUR_MINUTE).format(date);
                    print(_date);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        !_isMarketOpen
                            ? Text(
                                "Market is closed at time\n $_date",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: blackC,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              )
                            : MaterialButton(
                                onPressed: () {},
                                child: Text(
                                  "Check Market Open Status",
                                  style: TextStyle(color: blackC),
                                ),
                              )
                      ],
                    );
                  } else if (state is MarketDepthError) {
                    return Text(state.errorMessage);
                  } else if (state is MarketDepthFetched ||
                      state is MarketDepthRefreshing) {
                    List<MarketDepthList> buy =
                        state.data.marketDepth.buyMarketDepthList;
                    List<MarketDepthList> sell =
                        state.data.marketDepth.sellMarketDepthList;
                    return Container(
                      child: Column(
                        children: [
                          Text("Top 5 Buy"),
                          DataTable(
                            columns: [
                              DataColumn(label: Text('Order')),
                              DataColumn(label: Text('Quantity')),
                              DataColumn(label: Text('PRice')),
                            ],
                            rows: List.generate(buy.length, (index) {
                              var _item = buy[index];
                              return DataRow(cells: [
                                DataCell(Text(_item.orderCount.toString(),
                                    style: TextStyle(color: blackC))),
                                DataCell(Text(_item.quantity.toString(),
                                    style: TextStyle(color: blackC))),
                                DataCell(Text(
                                    _item.orderBookOrderPrice.toString(),
                                    style: TextStyle(color: blackC))),
                              ]);
                            }),
                          ),
                          Text("Top 5 Sell"),
                          DataTable(
                            columns: [
                              DataColumn(label: Text('Order')),
                              DataColumn(label: Text('Quantity')),
                              DataColumn(label: Text('Price')),
                            ],
                            rows: List.generate(buy.length, (index) {
                              var _item = sell[index];
                              return DataRow(cells: [
                                DataCell(Text(_item.orderCount.toString(),
                                    style: TextStyle(color: blackC))),
                                DataCell(Text(_item.quantity.toString(),
                                    style: TextStyle(color: blackC))),
                                DataCell(Text(
                                    _item.orderBookOrderPrice.toString(),
                                    style: TextStyle(color: blackC))),
                              ]);
                            }),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            // TextField(
            //   controller: _textController,
            //   onSubmitted: (value) {
            //     if (value != null) {
            //       BlocProvider.of<MarketDepthBloc>(context)
            //           .add(GetMarketDepth(1));
            //       FocusScope.of(context).unfocus();
            //     }
            //   },
            //   decoration: InputDecoration(
            //     hintText: "Enter symbol",
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
