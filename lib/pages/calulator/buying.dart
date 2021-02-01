import 'package:flutter/material.dart';
import 'package:stock_companion/utils/util_functions.dart';
import 'package:stock_companion/utils/utils.dart';

import 'common.dart';

class Buying extends StatefulWidget {
  final TextEditingController priceController, unitsController;

  const Buying({this.priceController, this.unitsController});
  @override
  _BuyingState createState() => _BuyingState();
}

class _BuyingState extends State<Buying> {
  int _shareAmount = 0;
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
              controller: widget.priceController,
              hint: "Enter buying price",
              label: "Buying Price"),
          buildTextField(
              controller: widget.unitsController,
              hint: "Enter no of  shares",
              label: "No of shares"),
          Builder(
            builder: (context) {
              var _price = widget.priceController.text == ""
                  ? "0"
                  : widget.priceController.text;
              var _units = widget.unitsController.text == ""
                  ? "0"
                  : widget.priceController.text;

              var price = int.parse(_price);
              var units = int.parse(_units);
              var _total = (price * units);

              _shareAmount = _total;

              _sebonComm = getSebonCommission(_shareAmount);
              _brokerComm = getBrokerCommission(_shareAmount);

              var total = _total.toString() == "0" ? "" : _total.toString();

              return Column(children: [
                CalculatorRow(text: "Share Amount", value: total),

                CalculatorRow(
                    text: "Broker Commission", value: _brokerComm.toString()),
                CalculatorRow(
                    text: "SEBON Commission", value: _sebonComm.toString()),
                CalculatorRow(
                    text: "DP Fee", value: Constants.dpFee.toString()),

                ///
                CalculatorRow(
                    text: "Cost Per Share ",
                    value: ((_shareAmount +
                                _sebonComm +
                                _brokerComm +
                                Constants.dpFee) /
                            price)
                        .toString()),
                CalculatorRow(text: "Total Payable Amount", value: ""),
              ]);
            },
          )
        ],
      ),
    );
  }
}
