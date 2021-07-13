import 'package:flutter/material.dart';
import 'package:stock_companion/pages/calulator/buying.dart';
import 'package:stock_companion/utils/util_functions.dart';
import 'package:stock_companion/utils/utils.dart';

import 'common.dart';

class Selling extends StatefulWidget {
  final TextEditingController buyController, sellController, unitsController;

  const Selling(
      {required this.buyController,
      required this.sellController,
      required this.unitsController});
  @override
  _SellingState createState() => _SellingState();
}

class _SellingState extends State<Selling> {
  double _purchaseAmount = 0;
  double _sellAmount = 0;
  double _sebonComm = 0;
  double _brokerComm = 0;

  Widget buildTextField(
      {TextEditingController controller, String hint, String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          onChanged: (value) {
            setState(() {});
          },
          style: TextStyle(color: blackC),
          decoration: InputDecoration(
              labelText: label,
              hintText: hint,
              alignLabelWithHint: true,
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: EdgeInsets.only(left: 10)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Builder(
            builder: (context) {
              var _buyPrice = widget.buyController.text == "" ||
                      widget.buyController.text == null
                  ? "0"
                  : widget.buyController.text;

              var _sellPrice = widget.sellController.text == "" ||
                      widget.sellController.text == null
                  ? "0"
                  : widget.sellController.text;

              var _units = widget.unitsController.text == "" ||
                      widget.unitsController.text == null
                  ? "0"
                  : widget.unitsController.text;

              var buyPrice = double.parse(_buyPrice);
              var sellPrice = double.parse(_sellPrice);
              var units = double.parse(_units);

              _purchaseAmount = (buyPrice * units);
              _sellAmount = sellPrice * units;

              _sebonComm = getSebonCommission(_sellAmount);
              _brokerComm = getBrokerCommission(_sellAmount);

              _sellAmount =
                  _sellAmount - _sebonComm - _brokerComm - Constants.dpFee;

              var total =
                  _sellAmount.toString() == "0" ? "" : _sellAmount.toString();

              var _profit = _sellAmount - _purchaseAmount;

              var _capitalGainLossTax =
                  getCapitalGainTax(_purchaseAmount, _sellAmount, true);

              var _totalRecievableAmount = _sellAmount -
                  _sebonComm -
                  _brokerComm -
                  Constants.dpFee -
                  _capitalGainLossTax;

              return Column(children: [
                buildHozCard(
                  key: "Share Amount:   ",
                  value: total,
                  width: width * 0.9,
                ),
                buildHozCard(
                  key: "Broker Commission:   ",
                  value: _brokerComm.toStringAsFixed(2),
                  width: width * 0.9,
                ),
                buildHozCard(
                  key: "SEBON Commission:   ",
                  value: _sebonComm.toStringAsFixed(2),
                  width: width * 0.9,
                ),
                buildHozCard(
                  key: "DP Fee:   ",
                  value: Constants.dpFee.toStringAsFixed(2),
                  width: width * 0.9,
                ),
                buildHozCard(
                  key: "Capital Gain Tax: ",
                  value: _capitalGainLossTax.toString(),
                  width: width * 0.9,
                ),
                buildHozCard(
                  key: "Total Recievable:  ",
                  value: _totalRecievableAmount.toStringAsFixed(2),
                  width: width * 0.9,
                ),
                buildHozCard(
                    color: _profit > 0 ? Colors.green : Colors.red,
                    key: _profit > 0 ? "Profit:   " : "Loss:   ",
                    value: _profit.toStringAsFixed(2),
                    width: width * 0.9,
                    verPad: 30.0,
                    isColumn: true,
                    valueStyle: TextStyle(
                        color: whiteC,
                        fontSize: 35,
                        fontWeight: FontWeight.bold)),
              ]);
            },
          ),
          Column(
            children: [
              buildTextField(
                  controller: widget.buyController,
                  hint: "Enter buying price ",
                  label: "BUying Price"),
              buildTextField(
                  controller: widget.sellController,
                  hint: "Enter Selling price",
                  label: "Selling Price"),
              buildTextField(
                  controller: widget.unitsController,
                  hint: "Enter no of  shares",
                  label: "No of shares"),
            ],
          ),
        ],
      ),
    );
  }
}
