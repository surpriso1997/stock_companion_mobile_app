import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/index_graph/company_graph.dart';
import 'package:stock_companion/models/company_list_model.dart';
import 'package:stock_companion/models/stock_price.dart';
import 'package:stock_companion/utils/theme.dart';
import 'package:stock_companion/widgets/company_graph.dart';

class CompanyDetails extends StatefulWidget {
  final CompanyListModel company;
  final StockPrice stockPrice;
  const CompanyDetails({required this.company, required this.stockPrice});
  @override
  _CompanyDetailsState createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<CompanyGraphBloc>(context)
        .add(FetchGraph(id: widget.stockPrice.securityId));
  }

  TextStyle _style = TextStyle(color: blackC, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    buildCard(Widget child) {
      return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
          decoration: BoxDecoration(
              color: rhoodGreen,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  color: Colors.black87,
                  offset: Offset(5, 5),
                )
              ]),
          child: child);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.company.companyName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 350,
            child: CmpanyGraph(),
          ),
          Column(
            children: [
              buildCard(Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Security Name:" + widget.company.securityName,
                      style: _style),
                  Text("Symbol: " + widget.company.symbol, style: _style),
                  Text("Sector: " + widget.company.sectorName, style: _style),
                  Text("Company Full Name: " + widget.company.companyName,
                      style: _style),
                ],
              )),
              buildCard(Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("As of:" + widget.stockPrice.lastUpdatedTime,
                      style: _style),
                  Text(
                      "Last Update Price: Rs." +
                          widget.stockPrice.lastUpdatedPrice.toString(),
                      style: _style),
                  Text(
                      "Closing Price: Rs." +
                          widget.stockPrice.closePrice.toString(),
                      style: _style),
                  Text(
                      "Open Price: Rs." +
                          widget.stockPrice.openPrice.toString(),
                      style: _style),
                  Text(
                      "Total Traded Quantity:" +
                          widget.stockPrice.totalTradedQuantity.toString(),
                      style: _style),
                  Text(
                      "Total Traded Value:" +
                          widget.stockPrice.totalTradedValue.toString(),
                      style: _style),
                ],
              )),
              buildCard(Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "52 Week High: Rs." +
                          widget.stockPrice.fiftyTwoWeekHigh.toString(),
                      style: _style),
                  Text(
                      "52 week Low: Rs." +
                          widget.stockPrice.fiftyTwoWeekLow.toString(),
                      style: _style),
                  Text(
                      "Market Cap" +
                          widget.stockPrice.marketCapitalization.toString(),
                      style: _style),
                ],
              )),
            ],
          ),
        ],
      ),
    );
  }
}
