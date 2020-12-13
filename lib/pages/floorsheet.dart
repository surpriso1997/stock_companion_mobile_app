import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/floorsheet/floorsheet_bloc.dart';
import 'package:stock_companion/models/models.dart';
import 'package:stock_companion/utils/scaling.dart';
import 'package:stock_companion/utils/utils.dart';
import 'package:stock_companion/widgets/fucntional_widgets.dart';
import '../bloc/floorsheet/floorsheet_state.dart';

class Floorsheet extends StatefulWidget {
  @override
  _FloorsheetState createState() => _FloorsheetState();
}

class _FloorsheetState extends State<Floorsheet> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();

    BlocProvider.of<FloorsheetBloc>(context).add(FetchItems());

    _controller = ScrollController()
      ..addListener(() {
        var _position = _controller.position;
        if (_controller.offset >= _position.maxScrollExtent &&
            !_position.outOfRange) {
          print('oll');

          BlocProvider.of<FloorsheetBloc>(context).add(FetchMoreItems());
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final width = MediaQuery.of(context).size.width;
    final _theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Floorsheet"),
      ),
      body: Container(
        child: BlocBuilder<FloorsheetBloc, FloorsheetState>(
            builder: (context, state) {
          print(state);
          if (state is FetchingItemsState) {
            return progressIndicator();
          } else if (state is FetchedItemsState) {
            return Column(
              children: [
                Flexible(
                  child: SingleChildScrollView(
                    controller: _controller,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          headingRowColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.green),
                          headingTextStyle: _theme
                              .dataTableTheme.headingTextStyle
                              .copyWith(color: whiteC),
                          columns: [
                            DataColumn(label: Text('SN')),
                            DataColumn(label: Text('SY')),
                            DataColumn(label: Text('BB')),
                            DataColumn(label: Text('SB')),
                            DataColumn(label: Text('QTY')),
                            DataColumn(label: Text('Rate')),
                            DataColumn(label: Text('Amt')),
                          ],
                          rows: List.generate(state.listItems.length, (index) {
                            Details _item = state.listItems[index];
                            return DataRow(cells: [
                              DataCell(Text('${index + 1}')),
                              DataCell(Text(_item.stockSymbol)),
                              DataCell(Text('${_item.buyerMemberId}')),
                              DataCell(Text('${_item.sellerMemberId}')),
                              DataCell(Text('${_item.contractQuantity}')),
                              DataCell(Text('${_item.contractRate}')),
                              DataCell(Text('${_item.contractAmount}')),
                            ]);
                          })),
                    ),
                  ),
                )
              ],
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
