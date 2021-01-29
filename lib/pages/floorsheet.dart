import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/floorsheet/floorsheet_bloc.dart';
import 'package:stock_companion/models/models.dart';
import 'package:stock_companion/pages/company_details.dart';
import 'package:stock_companion/pages/pages.dart';
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
  bool _isLoadingMore = false;
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

  Widget clickableChild(Widget child, Details item) {
    return InkWell(
      child: child,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => CompanyDetails(company: item.toCompany)));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final width = MediaQuery.of(context).size.width;
    final _theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButton: CircleAvatar(
        radius: 30,
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            AntDesign.filter,
            color: whiteC,
            size: 30,
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Floorsheet"),
      ),
      body: SafeArea(
        bottom: true,
        child: Container(
          child: BlocListener<FloorsheetBloc, FloorsheetState>(
            listenWhen: (old, state) {
              if (state is RefreshingItems) {
                _isLoadingMore = true;
                setState(() {});
              } else if (state is FetchedItemsState) {
                _isLoadingMore = false;
                setState(() {});
              }
            },
            listener: (context, state) {},
            child: BlocBuilder<FloorsheetBloc, FloorsheetState>(
                builder: (context, state) {
              print(state);
              if (state is FetchingItemsState) {
                return progressIndicator();
              } else if (state is FetchedItemsState ||
                  state is RefreshingItems) {
                var _list = state.listItems;
                return Column(
                  children: [
                    Flexible(
                      child: SingleChildScrollView(
                        controller: _controller,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                              headingRowColor:
                                  MaterialStateProperty.resolveWith(
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
                              rows: List.generate(state.listItems.length,
                                  (index) {
                                Details _item = state.listItems[index];
                                return DataRow(
                                  cells: [
                                    DataCell(clickableChild(
                                        Text('${index + 1}'), _item)),
                                    DataCell(
                                      clickableChild(
                                          Text(_item.stockSymbol,
                                              style:
                                                  TextStyle(fontWeight: bold)),
                                          _item),
                                    ),
                                    DataCell(
                                      clickableChild(
                                          Text('${_item.buyerMemberId}'),
                                          _item),
                                    ),
                                    DataCell(clickableChild(
                                        Text('${_item.sellerMemberId}'),
                                        _item)),
                                    DataCell(clickableChild(
                                        Text('${_item.contractQuantity}'),
                                        _item)),
                                    DataCell(clickableChild(
                                        Text('${_item.contractRate}'), _item)),
                                    DataCell(clickableChild(
                                        Text('${_item.contractAmount}'),
                                        _item)),
                                  ],
                                );
                              })),
                        ),
                      ),
                    ),
                    if (_isLoadingMore) progressIndicator()
                  ],
                );
              } else {
                return Container();
              }
            }),
          ),
        ),
      ),
    );
  }
}
