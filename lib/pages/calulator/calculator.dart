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
      body: SafeArea(
        top: true,
        bottom: true,
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Container(
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
                  BonusShareAdjustMent(),
                  BonusShareAdjustMent(),
                ]),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
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
            ),
          ],
        ),
      ),
    );
  }
}

class BonusShareAdjustMent extends StatefulWidget {
  @override
  _BonusShareAdjustMentState createState() => _BonusShareAdjustMentState();
}

class _BonusShareAdjustMentState extends State<BonusShareAdjustMent> {
  TextEditingController _priceController;
  TextEditingController _percentageController;

  int _paidUpPerValue = 100;

  @override
  void initState() {
    super.initState();

    _priceController = TextEditingController();
    _percentageController = TextEditingController();
  }

  getAdjustPrice() {
    var _price = _priceController.text ?? "0";
    var _percent = _percentageController.text ?? "0";

    var __percent = double.parse(_percent) / 100;

    return int.parse(_price) / (1 + __percent);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            controller: _priceController,
            onSubmitted: (value) {},
            decoration: InputDecoration(
              hintText: "Market Price Before Book Closure",
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: _percentageController,
            onSubmitted: (value) {},
            decoration: InputDecoration(
              hintText: "Percentage",
            ),
          ),

          Text("Paid up Value per share"),
          DropdownButton(
            value: _paidUpPerValue,
            onChanged: (value) {
              _paidUpPerValue = value;
            },
            items: [100, 10]
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e.toString(),
                      style: TextStyle(color: blackC),
                    ),
                  ),
                )
                .toList(),
          ),
          Text(
            "Price After AdjustMent ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // Text("Rs . ${getAdjustPrice()}")
        ],
      ),
    );
  }
}
