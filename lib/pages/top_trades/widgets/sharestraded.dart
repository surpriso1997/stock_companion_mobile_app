import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/bloc/top_trades/top_trades_blocs.dart';
import 'package:stock_companion/models/top_trades.dart';
import 'package:stock_companion/utils/utils.dart';
import 'package:stock_companion/widgets/fucntional_widgets.dart';

class SharesTraded extends StatefulWidget {
  @override
  _SharesTradedState createState() => _SharesTradedState();
}

class _SharesTradedState extends State<SharesTraded> {
  @override
  void initState() {
    super.initState();

    // BlocProvider.of<SharesTradedBloc>(context).add(FetchItems());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    getDataColumnMargin(width) {
      print(width);
      if (width < 350) {
        return 25.0;
      } else if (width > 350 && width < 375) {
        return 40.0;
      } else if (width > 375) {
        return 60.0;
      } else if (width > 500) {
        return 150.0;
      }
    }

    return BlocBuilder<SharesTradedBloc, CommonState>(
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
                  horizontalMargin: 30,
                  headingTextStyle: Theme.of(context)
                      .dataTableTheme
                      .headingTextStyle
                      .copyWith(color: whiteC),
                  // columnSpacing: getDataColumnMargin(width),
                  showCheckboxColumn: false,
                  columns: [
                    DataColumn(label: Text('SY')),
                    DataColumn(label: Text('Shares Traded')),
                    DataColumn(label: Text('LTP')),
                  ],
                  rows: List.generate(
                      state.listItems.length > 20 ? 20 : state.listItems.length,
                      (index) {
                    TopItem _item = state.listItems[index];
                    final _style = TextStyle(color: blackC, fontSize: 16);
                    return DataRow(cells: [
                      DataCell(Text(_item.symbol, style: _style)),
                      DataCell(Text(_item.shareTraded, style: _style)),
                      DataCell(
                          Text(_item.closingPrice.toString(), style: _style)),
                    ]);
                  })),
            )),
          ),
        ],
      );
    });
  }
}
