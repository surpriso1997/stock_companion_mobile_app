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
  double _shareAmount = 0;
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: Container(
          height: height * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 30),
              Expanded(
                child: Builder(
                  builder: (context) {
                    var _price = widget.priceController.text == "" ||
                            widget.priceController.text == null
                        ? "0"
                        : widget.priceController.text;
                    var _units = widget.unitsController.text == "" ||
                            widget.unitsController.text == null
                        ? "0"
                        : widget.unitsController.text;

                    var price = double.parse(_price);
                    var units = double.parse(_units);
                    var _total = (price * units);

                    _shareAmount = _total;

                    _sebonComm = getSebonCommission(_shareAmount);
                    _brokerComm = getBrokerCommission(_shareAmount);

                    var total = _total.toString() == "0" ? 0.0 : _total;
                    var _totalPayableAmount = total + _sebonComm + _brokerComm;
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        children: [
                          buildHozCard(
                            key: "Share Amount:   ",
                            value: total.toString(),
                            width: width * 0.9,
                          ),
                          buildHozCard(
                              width: width * 0.9,
                              key: "Broker Commission:   ",
                              value: _brokerComm.toStringAsFixed(2)),
                          buildHozCard(
                              width: width * 0.9,
                              key: "SEBON Commission:   ",
                              value: _sebonComm.toStringAsFixed(2)),
                          buildHozCard(
                              width: width * 0.9,
                              key: "DP Fee:",
                              value: Constants.dpFee.toString()),
                          buildHozCard(
                              width: width * 0.9,
                              key: "Cost Per Share:   ",
                              value: ((_shareAmount +
                                          _sebonComm +
                                          _brokerComm +
                                          Constants.dpFee) /
                                      price)
                                  .toStringAsFixed(2)),
                          SizedBox(height: 30),
                          buildHozCard(
                            isColumn: true,
                            verPad: 30.0,
                            hozPad: 30.0,
                            color: Colors.red,
                            width: width,
                            valueStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                            key: "Total Payable Amount",
                            value:
                                "Rs " + _totalPayableAmount.toStringAsFixed(2),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Column(
                children: [
                  buildTextField(
                      controller: widget.priceController,
                      hint: "Enter buying price",
                      label: "Buying Price"),
                  buildTextField(
                      controller: widget.unitsController,
                      hint: "Enter no of  shares",
                      label: "No of shares"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

buildHozCard({
  @required key,
  @required value,
  var hozPad,
  var verPad,
  var borderRadius,
  var width,
  Color color,
  TextStyle keyStyle,
  TextStyle valueStyle,
  bool isColumn = false,
}) {
  var children = [
    Text(key,
        style: keyStyle ??
            TextStyle(
              color: whiteC,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            )),
    Text(value,
        style: valueStyle ??
            TextStyle(
              color: whiteC,
              fontWeight: FontWeight.w700,
              fontSize: 26,
            ))
  ];

  return Container(
    width: width,
    margin: EdgeInsets.symmetric(vertical: 5),
    padding:
        EdgeInsets.symmetric(horizontal: hozPad ?? 10, vertical: verPad ?? 10),
    decoration: BoxDecoration(
        color: color ?? Color(0xff5acf9a),
        borderRadius: BorderRadius.circular(borderRadius ?? 10)),
    child: isColumn
        ? Column(
            children: [
              children[0],
              SizedBox(height: 10),
              children[1],
            ],
          )
        : Row(
            children: [...children],
          ),
  );
}
