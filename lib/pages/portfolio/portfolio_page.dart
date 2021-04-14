import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import 'package:stock_companion/data/repository/data_repository.dart';
import 'package:stock_companion/models/stock_price.dart';
import 'package:stock_companion/utils/utils.dart';

class Portfolio extends StatefulWidget {
  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  final _controller = TextEditingController();

  static String _displayStringForOption(StockPrice price) => price.securityName;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showSearch(
            context: context,
            delegate: SearchPage<StockPrice>(
              items: DataRepository().companies,
              searchLabel: 'Search stock name or symbol',
              builder: (price) {
                return ListTile(
                  leading: Text(price.symbol),
                  title: Text(
                    price.securityName,
                    style: TextStyle(color: Colors.black),
                  ),
                );
              },
              filter: (price) {
                return [
                  price.securityName,
                  price.symbol,
                ];
              },
              suggestion:
                  Center(child: Text('Filter people by name, surname or age')),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
