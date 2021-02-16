import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:stock_companion/pages/calulator/selling.dart';
import 'package:stock_companion/utils/utils.dart';

import 'buying.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  double buyPriceBuy;
  double buyUnitsBuy;

  double sellPrice;
  double buyUnitsSell;
  double buyPriceSell;

  TextEditingController _buyPriceController;
  TextEditingController _buyUnitsController;

  TextEditingController _buytPriceSellController;
  TextEditingController _sellPriceController;
  TextEditingController _sellUnitsController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);

    _buyPriceController = TextEditingController();
    _buyUnitsController = TextEditingController();

    _buytPriceSellController = TextEditingController();
    _sellPriceController = TextEditingController();
    _sellUnitsController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: Column(
            children: [
              Container(
                height: _height - 80,
                child: TabBarView(controller: _tabController, children: [
                  // Container(color: whiteC),
                  Buying(
                      priceController: _buyPriceController,
                      unitsController: _buyUnitsController),
                  Selling(
                    sellController: _sellPriceController,
                    buyController: _buytPriceSellController,
                    unitsController: _sellUnitsController,
                  ),
                  Container(color: Colors.red),
                  Container(color: Colors.pink),
                ]),
              ),
              Container(
                height: 80,
                color: Colors.yellow,
                child: AppBar(
                  automaticallyImplyLeading: false,
                  bottom: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    indicatorColor: _theme.textSelectionColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 2.0,
                    labelStyle: TextStyle(fontSize: 20),
                    labelPadding:
                        EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    tabs: [
                      Text("Buying"),
                      Text("Selling"),
                      Text("Bonus"),
                      Text("Right"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
