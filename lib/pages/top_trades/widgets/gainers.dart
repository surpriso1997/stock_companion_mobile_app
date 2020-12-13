import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/bloc/top_trades/gainers.dart';
import 'package:stock_companion/models/top_trades.dart';
import 'package:stock_companion/utils/scaling.dart';
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

    // BlocProvider.of<GainersBloc>(context).add(FetchItems());
  }

  getDataColumnMargin(width) {
    print(width);
    if (width < 350) {
      return 30.0;
    } else if (width > 350 && width < 375) {
      return 40.0;
    } else if (width > 375) {
      return 70.0;
    } else if (width > 500) {
      return 150.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final width = MediaQuery.of(context).size.width;
    getDataColumnMargin(width) {
      print(width);
      if (width < 350) {
        return 30.0;
      } else if (width > 350 && width < 375) {
        return 40.0;
      } else if (width > 375) {
        return 60.0;
      } else if (width > 500) {
        return 150.0;
      }
    }

    return BlocBuilder<GainersBloc, CommonState>(builder: (context, state) {
      if (state is FetchingItemsState) {
        return progressIndicator();
      } else if (state is ErrorState) {
        return errorWidget(state.message, () {});
      } else if (state is NoDataState) {
        return noDataFound();
      } else if (state is RefreshingItems || state is FetchedItemsState) {
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
                      columnSpacing:
                          //  SizeConfig.blockSizeHorizontal * 8,
                          getDataColumnMargin(width),
                      columns: [
                        DataColumn(label: Text('SN')),
                        DataColumn(label: Text('LTP')),
                        DataColumn(label: Text('Change')),
                      ],
                      rows: List.generate(
                          state.listItems.length > 20
                              ? 20
                              : state.listItems.length, (index) {
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
                              style: _style.copyWith(fontWeight: bold))),
                        ]);
                      }))),
            ),
          ],
        );
      }
    });
  }
}
