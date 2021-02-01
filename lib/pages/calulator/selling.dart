import 'package:flutter/material.dart';
import 'package:stock_companion/utils/util_functions.dart';
import 'package:stock_companion/utils/utils.dart';

import 'common.dart';

class Selling extends StatefulWidget {
  final TextEditingController buyController, sellController, unitsController;

  const Selling(
      {this.buyController, this.sellController, this.unitsController});
  @override
  _SellingState createState() => _SellingState();
}

class _SellingState extends State<Selling> {
  int _purchaseAmount = 0;
  double _sellAmount = 0;
  double _sebonComm = 0;
  double _brokerComm = 0;

  Widget buildTextField(
      {TextEditingController controller, String hint, String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: blackC,
            )),
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
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 10)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          buildTextField(
              controller: widget.sellController,
              hint: "Enter Selling price",
              label: "Selling Price"),
          buildTextField(
              controller: widget.buyController,
              hint: "Enter no of shares",
              label: "No of shares"),
          buildTextField(
              controller: widget.unitsController,
              hint: "Enter no of  shares",
              label: "No of shares"),
          Builder(
            builder: (context) {
              var _buyPrice = widget.buyController.text == ""
                  ? "0"
                  : widget.buyController.text;
              var _sellPrice = widget.buyController.text == ""
                  ? "0"
                  : widget.sellController.text;
              var _units = widget.unitsController.text == ""
                  ? "0"
                  : widget.unitsController.text;

              var buyPrice = int.parse(_buyPrice);
              var sellPrice = int.parse(_sellPrice);
              var units = int.parse(_units);

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
                CalculatorRow(text: "Share Amount", value: total),

                CalculatorRow(
                    text: "Broker Commission", value: _brokerComm.toString()),
                CalculatorRow(
                    text: "SEBON Commission", value: _sebonComm.toString()),

                CalculatorRow(
                    text: "DP Fee", value: Constants.dpFee.toString()),

                CalculatorRow(
                  text: "Capital Gain Tax",
                  value: _profit.toString(),
                ),

                ///
                CalculatorRow(
                    text: "Total Recievable",
                    value: ((_sellAmount -
                            _sebonComm -
                            _brokerComm -
                            Constants.dpFee))
                        .toString()),
                // CalculatorRow(
                //   text: "Total Payable Amount",
                //   value: _totalRecievableAmount.toString(),
                // ),

                Container(
                  decoration: BoxDecoration(
                      color: _profit > 0 ? Colors.green : Colors.red),
                  child: Center(
                    child: Text(
                        _profit > 0 ? "Profit: $_profit" : "Loss: $_profit"),
                  ),
                ),
              ]);
            },
          )
        ],
      ),
    );
  }
}
