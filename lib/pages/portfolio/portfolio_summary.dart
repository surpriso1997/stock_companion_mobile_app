import 'package:flutter/material.dart';
import 'package:stock_companion/data/provider/database.dart';
import 'package:stock_companion/data/repository/data_repository.dart';
import 'package:stock_companion/models/company_dailyData.dart';
import 'package:stock_companion/models/portfolio/portfolio_model.dart';
import 'package:stock_companion/pages/portfolio/portfolio_future_widget.dart';
import 'package:stock_companion/utils/theme.dart';
import 'package:stock_companion/widgets/fucntional_widgets.dart';

class PortfolioSummary extends StatefulWidget {
  @override
  _PortfolioSummaryState createState() => _PortfolioSummaryState();
}

textColumn(
    {String key, String value, TextStyle keyStyle, TextStyle valueStyle}) {
  return Row(children: [
    Text(
      key.toString() + ":  ",
      style: keyStyle ?? TextStyle(fontSize: 14),
    ),
    Text(
      value.toString(),
      style: keyStyle ?? TextStyle(fontSize: 20, fontWeight: bold),
    )
  ]);
}

class _PortfolioSummaryState extends State<PortfolioSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Portfolio summary"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PortfolioFutureBuilder(),
          ],
        ),
      ),
    );
  }
}
