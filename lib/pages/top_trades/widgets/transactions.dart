import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/bloc/top_trades/top_trades_blocs.dart';
import 'package:stock_companion/models/models.dart';
import 'package:stock_companion/utils/utils.dart';
import 'package:stock_companion/widgets/fucntional_widgets.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<TransactionsBloc>(context).add(FetchItems());
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    getDataColumnMargin(width) {
      print(width);
      if (width < 350) {
        return 25.0;
      } else if (width > 350 && width < 375) {
        return 40.0;
      } else if (width > 375) {
        return 77.0;
      } else if (width > 500) {
        return 150.0;
      }
    }

    return BlocBuilder<TransactionsBloc, CommonState>(
        builder: (context, state) {
      if (state is FetchingItemsState) {
        return progressIndicator();
      } else if (state is ErrorState) {
        return errorWidget(state.message, () {});
      } else if (state is NoDataState) {
        return noDataFound();
      } else if (state is RefreshingItems || state is FetchedItemsState) {}
      return Column(
        children: [
          Flexible(
            child: SingleChildScrollView(
                child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  headingTextStyle: Theme.of(context)
                      .dataTableTheme
                      .headingTextStyle
                      .copyWith(color: whiteC),
                  // columnSpacing: 60,
                  // columnSpacing: getDataColumnMargin(width),
                  // horizontalMargin: 44,
                  //
                  columns: [
                    DataColumn(label: Text('SN')),
                    DataColumn(label: Text('Total\nTrades')),
                    DataColumn(label: Text('LTP')),
                  ],
                  rows: List.generate(
                      state.listItems.length > 20 ? 20 : state.listItems.length,
                      (index) {
                    TopItem _item = state.listItems[index];
                    final _style = _theme.dataTableTheme.dataTextStyle
                        .copyWith(fontSize: 16);
                    return DataRow(cells: [
                      DataCell(Text(
                        _item.symbol,
                        style: _style.copyWith(fontWeight: FontWeight.bold),
                      )),
                      DataCell(Text(_item.totalTrades, style: _style)),
                      DataCell(Text(_item.lastTradedPrice.toString(),
                          style: _style)),
                    ]);
                  })),
            )),
          ),
        ],
      );
    });
  }
}
