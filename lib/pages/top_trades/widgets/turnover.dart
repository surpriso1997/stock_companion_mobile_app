import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/bloc/top_trades/top_trades_blocs.dart';
import 'package:stock_companion/models/models.dart';
import 'package:stock_companion/utils/utils.dart';
import 'package:stock_companion/widgets/fucntional_widgets.dart';

class Turnover extends StatefulWidget {
  @override
  _TurnoverState createState() => _TurnoverState();
}

class _TurnoverState extends State<Turnover> {
  getTurnover(turn) {
    var _indouble = double.tryParse(turn);
    if (_indouble != null) {
      _indouble = _indouble / 10000000;
    }
    return _indouble.toStringAsFixed(4);
  }

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<TurnoverBloc>(context).add(FetchItems());
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
        return 65.0;
      } else if (width > 500) {
        return 150.0;
      }
    }

    return BlocBuilder<TurnoverBloc, CommonState>(builder: (context, state) {
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
                child: DataTable(
                    columnSpacing: getDataColumnMargin(width),
                    headingTextStyle: Theme.of(context)
                        .dataTableTheme
                        .headingTextStyle
                        .copyWith(color: whiteC),
                    columns: [
                      DataColumn(label: Text('SY')),
                      DataColumn(label: Text('Turnover(Cr.)')),
                      DataColumn(label: Text('LTP')),
                    ],
                    rows: List.generate(
                        state.listItems.length > 20
                            ? 20
                            : state.listItems.length, (index) {
                      TopItem _item = state.listItems[index];
                      final _style = _theme.dataTableTheme.dataTextStyle;
                      return DataRow(cells: [
                        DataCell(Text(
                          _item.symbol,
                          style: _style.copyWith(fontWeight: FontWeight.bold),
                        )),
                        DataCell(Text(getTurnover(_item.turnover.toString()),
                            style: _style)),
                        DataCell(
                            Text(_item.closingPrice.toString(), style: _style)),
                      ]);
                    }))),
          ),
        ],
      );
    });
  }
}
