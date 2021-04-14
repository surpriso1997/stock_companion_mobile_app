import 'package:flutter/material.dart';
import 'package:stock_companion/data/provider/database.dart';
import 'package:stock_companion/data/repository/data_repository.dart';
import 'package:stock_companion/models/company_dailyData.dart';
import 'package:stock_companion/models/portfolio/portfolio_model.dart';
import 'package:stock_companion/pages/portfolio/portfolio_summary.dart';
import 'package:stock_companion/utils/theme.dart';
import 'package:stock_companion/widgets/fucntional_widgets.dart';

class PortfolioFutureBuilder extends StatefulWidget {
  @override
  _PortfolioFutureBuilderState createState() => _PortfolioFutureBuilderState();
}

class _PortfolioFutureBuilderState extends State<PortfolioFutureBuilder> {
  double getProfit(PortfolioModel port) {
    var company = DataRepository().companies.firstWhere(
        (element) => element.symbol.toLowerCase() == port.symbol.toLowerCase(),
        orElse: () => null);

    if (company != null) {
      var buyPrice = double.tryParse(port.buyingPrice.toString());
      var ltp = double.tryParse(company.lastTradedPrice.toString());

      return ltp - buyPrice;
    }
  }

  getCompany(PortfolioModel port) {
    var company = DataRepository().companies.firstWhere(
        (element) => element.symbol.toLowerCase() == port.symbol.toLowerCase(),
        orElse: () => null);

    if (company != null) {
      return company;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: DbHelper().listAllPortfolioCompanies(),
      builder: (context, snapshot) {
        print(snapshot.connectionState);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return progressIndicator();
        }
        if (snapshot.connectionState == ConnectionState.active) {
          return Text("active");
        } else if (snapshot.connectionState == ConnectionState.done) {
          print(snapshot.data);

          if (snapshot.data.isNotEmpty) {
            List<PortfolioModel> ports = snapshot.data
                .map<PortfolioModel>((e) => PortfolioModel.fromJson(e))
                .toList();

            return Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: ListView.builder(
                        itemCount: ports.length,
                        itemBuilder: (context, index) {
                          PortfolioModel port = ports[index];
                          double profit = getProfit(port);

                          bool _isProfit = profit > 0;
                          var bgColor = profit == 0
                              ? Colors.grey
                              : profit > 0
                                  ? rhoodGreen
                                  : Colors.red.withOpacity(.7);

                          CompanyDataModel comp = getCompany(port);

                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 13, vertical: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 8),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(port.symbol,
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: bold)),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          await DbHelper()
                                              .deletePortfolioCompany(
                                                  portfolioId: port.id);
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          Icons.delete_outline_rounded,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      )
                                    ]),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    textColumn(
                                        key: "Buying Price",
                                        value: port.buyingPrice),
                                    textColumn(
                                        key: "Units", value: port.buyingUnits),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    textColumn(
                                        key: "LTP",
                                        value:
                                            comp?.lastTradedPrice.toString()),
                                    textColumn(
                                      key: _isProfit ? "Profit" : "Loss",
                                      value: profit.toString(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            );
          } else {
            return Text(
              "Looks like you have empty portfolio,\n Press plus icon to add stock.",
              style: TextStyle(color: blackC, fontSize: 22),
            );
          }
        }
      },
    );
  }
}
