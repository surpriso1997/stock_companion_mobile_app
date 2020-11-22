import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/bloc/top_trades/gainers.dart';
import 'package:stock_companion/models/top_trades.dart';
import 'package:stock_companion/pages/top_trades/widgets/common.dart';
import 'package:stock_companion/utils/utils.dart';
import 'package:stock_companion/widgets/fucntional_widgets.dart';

class Gainers extends StatefulWidget {
  @override
  _GainersState createState() => _GainersState();
}

class _GainersState extends State<Gainers> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<GainersBloc>(context).add(FetchItems());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GainersBloc, CommonState>(builder: (context, state) {
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
                    headingRowColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.green),
                    headingTextStyle: Theme.of(context)
                        .dataTableTheme
                        .headingTextStyle
                        .copyWith(color: whiteC),
                    columns: [
                      DataColumn(label: Text('SN')),
                      DataColumn(label: Text('LTP')),
                      DataColumn(label: Text('Change')),
                    ],
                    rows: List.generate(state.listItems.length, (index) {
                      TopItem _item = state.listItems[index];
                      final _style = TextStyle(color: blackC, fontSize: 16);
                      return DataRow(cells: [
                        DataCell(Text(
                          _item.symbol,
                          style: _style,
                        )),
                        DataCell(Text(_item.ltp.toString(), style: _style)),
                        DataCell(Text(
                            "${_item.pointChange} (${_item.percentageChange} %)",
                            style: _style.copyWith(fontWeight: bold)))
                      ]);
                    }))),
          ),
        ],
      );
    });
  }
}
