import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:search_page/search_page.dart';
import 'package:stock_companion/data/provider/database.dart';
import 'package:stock_companion/data/repository/data_repository.dart';
import 'package:stock_companion/models/company_dailyData.dart';
import 'package:stock_companion/models/stock_price.dart';
import 'package:stock_companion/pages/portfolio/portfolio_future_widget.dart';
import 'package:stock_companion/pages/portfolio/portfolio_summary.dart';
import 'package:stock_companion/utils/utils.dart';

class Portfolio extends StatefulWidget {
  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  final _unitsController = TextEditingController();
  final _priceController = TextEditingController();

  static String _displayStringForOption(CompanyDataModel price) =>
      price.securityName;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;

    List<CompanyDataModel> _selectedCompanie = [];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showSearch(
            context: context,
            delegate: SearchPage<CompanyDataModel>(
                items: DataRepository().companies,
                searchLabel: 'Search stock name or symbol',
                builder: (company) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: blackC, width: 0.9)),
                    child: ListTile(
                      onTap: () {
                        // Navigator.pop(context);

                        showDialog(
                            context: context,
                            builder: (context) {
                              return Material(
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextField(
                                        controller: _priceController,
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(color: blackC),
                                        decoration: InputDecoration(
                                          hintText: "Buying price",
                                          labelText: "Buying Price ",
                                          labelStyle: TextStyle(color: blackC),
                                          hintStyle: TextStyle(color: blackC),
                                        ),
                                      ),
                                      TextField(
                                        controller: _unitsController,
                                        style: TextStyle(color: blackC),
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          hintText: "Bought units",
                                          labelText: "Bought units",
                                          labelStyle: TextStyle(color: blackC),
                                          hintStyle: TextStyle(color: blackC),
                                        ),
                                      ),
                                      MaterialButton(
                                        color: rhoodGreen,
                                        onPressed: () async {
                                          if (_unitsController.text == null ||
                                              _unitsController.text.isEmpty) {
                                            Fluttertoast.showToast(
                                                // textColor: blackC,
                                                fontSize: 16,
                                                backgroundColor: Colors.red,
                                                msg: "Units cannot be empty");
                                          } else if (_priceController.text ==
                                                  null ||
                                              _priceController.text.isEmpty) {
                                            Fluttertoast.showToast(
                                                fontSize: 16,
                                                backgroundColor: Colors.red,
                                                msg: "Price cannot be empty");
                                          } else {
                                            var _price = _priceController.text;
                                            var _units = _unitsController.text;

                                            if (int.parse(_price) <= 0) {
                                              Fluttertoast.showToast(
                                                  backgroundColor: Colors.red,
                                                  fontSize: 16,
                                                  msg: "Price cannot be 0");
                                            } else if (int.parse(_units) <= 0) {
                                              Fluttertoast.showToast(
                                                  backgroundColor: Colors.red,
                                                  fontSize: 16,
                                                  msg: "Price cannot be 0");
                                            } else {
                                              await DbHelper()
                                                  .addPortfolioCompany({
                                                "companyId": company.securityId,
                                                "symbol": company.symbol,
                                                "sectorName": "",
                                                "lastTradedPrice":
                                                    company.lastTradedPrice,
                                                "buyingPrice":
                                                    _priceController.text,
                                                "buyingUnits":
                                                    _unitsController.text,
                                                "buyingDate": DateTime.now()
                                                    .toLocal()
                                                    .toString()
                                              });

                                              _priceController.text = "";
                                              _unitsController.text = '';

                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          PortfolioSummary()));
                                            }
                                          }
                                        },
                                        child: Text("Add"),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      leading: Text(
                        company.symbol,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      title: Text(
                        company.securityName,
                        style: TextStyle(color: Colors.black),
                      ),
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
                    Center(child: Text('Search security by name or symbol'))),
          );
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        top: true,
        child: PortfolioFutureBuilder(),
      ),
    );
  }
}
