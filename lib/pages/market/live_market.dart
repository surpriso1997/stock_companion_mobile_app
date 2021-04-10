import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/bloc/live_market/live_market_bloc.dart';
import 'package:stock_companion/models/live_data.dart';
import 'package:stock_companion/pages/company/company_details.dart';
import 'package:stock_companion/utils/scaling.dart';
import 'package:stock_companion/utils/utils.dart';
import 'package:stock_companion/widgets/fucntional_widgets.dart';

class LiveMarket extends StatefulWidget {
  @override
  _LiveMarketState createState() => _LiveMarketState();
}

class _LiveMarketState extends State<LiveMarket> {
  ScrollController _controller;
  bool _isPaginateLoading = false;
  bool _isRefreshing = false;
  @override
  void initState() {
    super.initState();

    BlocProvider.of<LiveMarketBloc>(context).add(FetchItems());

    _controller = ScrollController()
      ..addListener(() {
        var _position = _controller.position;
        if (_controller.offset >= _position.maxScrollExtent &&
            !_position.outOfRange) {
          BlocProvider.of<LiveMarketBloc>(context).add(FetchMoreItems());
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final selectColor = _theme.textSelectionColor;
    final _tableTheme = _theme.dataTableTheme;
    final _tableTitleStyle = _theme.textTheme.button
        .copyWith(color: selectColor, fontWeight: FontWeight.w600);
    final _style = TextStyle(color: whiteC, fontSize: 16);

    return Scaffold(
      floatingActionButton: CircleAvatar(
        radius: SizeConfig.isTablet ? 25 : 30,
        backgroundColor: Theme.of(context).primaryColor,
        child: IconButton(
          onPressed: () {
            BlocProvider.of<LiveMarketBloc>(context).add(RefreshItems());
          },
          icon: Icon(
            SimpleLineIcons.refresh,
            color: whiteC,
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              AntDesign.left,
              color: whiteC,
            )),
        title: Text("Live Share"),
        actions: [
          IconButton(
              icon: Icon(
                Icons.timer,
                color: whiteC,
              ),
              onPressed: () {})
        ],
        elevation: 0.0,
      ),
      body: BlocListener<LiveMarketBloc, CommonState>(
        listener: (context, state) {
          if (state is FetchingMoreItemsState) {
            _isPaginateLoading = true;
            setState(() {});
          } else {
            _isPaginateLoading = false;
            setState(() {});
          }
        },
        child: BlocBuilder<LiveMarketBloc, CommonState>(
          builder: (context, state) {
            if (state is FetchingItemsState) {
              return progressIndicator();
            } else if (state is ErrorState) {
            } else if (state is FetchedItemsState ||
                state is RefreshingItems ||
                state is FetchingMoreItemsState) {
              return Column(
                children: [
                  Flexible(
                    child: SingleChildScrollView(
                      controller: _controller,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          showCheckboxColumn: false,
                          columns: [
                            DataColumn(label: Text('SY')),
                            DataColumn(label: Text('High')),
                            DataColumn(label: Text('LTP')),
                            DataColumn(label: Text('Low')),
                            DataColumn(label: Text('%')),
                            DataColumn(label: Text('P Close')),
                          ],
                          rows: List.generate(state.listItems.length, (index) {
                            LiveData item = state.listItems[index];

                            return DataRow(
                                onSelectChanged: (a) {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (_) => CompanyDetails(
                                                company: item
                                                    .gCompanyFromStockPrice(),
                                              )));
                                },
                                color: MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                  return item.lastTradedPrice ==
                                          item.previousClose
                                      ? Colors.grey
                                      : item.lastTradedPrice >
                                              item.previousClose
                                          ? Colors.green
                                          : Color(0xffb00000);
                                }),
                                cells: [
                                  DataCell(Text(item.symbol,
                                      style:
                                          _style.copyWith(fontWeight: bold))),
                                  DataCell(Text(item.highPrice.toString(),
                                      style: _style)),
                                  DataCell(Text(item.lastTradedPrice.toString(),
                                      style: _style)),
                                  DataCell(Text(item.lowPrice.toString(),
                                      style: _style)),
                                  DataCell(Text(
                                      item.percentageChange.toStringAsFixed(2),
                                      style: _style)),
                                  DataCell(Text(item.previousClose.toString(),
                                      style: _style)),
                                ]);
                          }),
                        ),
                      ),
                    ),
                  ),
                  if (_isPaginateLoading) progressIndicator()
                ],
              );
            } else
              return Container();
          },
        ),
      ),
    );
  }
}
