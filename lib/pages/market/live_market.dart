import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:stock_companion/utils/scaling.dart';
import 'package:stock_companion/utils/utils.dart';

class LiveMarket extends StatefulWidget {
  @override
  _LiveMarketState createState() => _LiveMarketState();
}

class _LiveMarketState extends State<LiveMarket> {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final selectColor = _theme.textSelectionColor;
    final _tableTheme = _theme.dataTableTheme;
    final _tableTitleStyle = _theme.textTheme.button
        .copyWith(color: selectColor, fontWeight: FontWeight.w600);

    Widget _buildTitleRow() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: symmetricHzPadding),
        height: 40,
        color: _theme.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "SY",
                style: _tableTitleStyle,
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "High ",
                    style: _tableTitleStyle,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "LTP",
                    style: _tableTitleStyle,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "%",
                    style: _tableTitleStyle,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "P Close",
                    style: _tableTitleStyle,
                    textAlign: TextAlign.start,
                  ),
                  Text("Qty",
                      style: _tableTitleStyle, textAlign: TextAlign.start),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget _builtTableChild({
      ThemeData theme,
      double per,
      double diff,
      String open,
      String high,
      String low,
      String ltp,
      String close,
      String quantity,
      String previousClose,
      String symbol,
    }) {
      Color bgColor = (diff < 0) ? Color(0xffFF0909) : Color(0xff21F595);

      if (per == 0.0) bgColor = whiteC;

      final _style = _tableTitleStyle.copyWith(
        color: bgColor,
        fontWeight: FontWeight.normal,
      );
      return InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.company_page);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: symmetricHzPadding),
          height: 40,
          color: Color(0xff2A2c2c),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  symbol ?? "",
                  style: _style,
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      high ?? "",
                      style: _style,
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      ltp ?? "",
                      style: _style,
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      per.toString() ?? "".toString(),
                      style: _style,
                      textAlign: TextAlign.start,
                    ),
                    Text(previousClose ?? "",
                        style: _style, textAlign: TextAlign.start),
                    Text(quantity ?? "",
                        style: _style, textAlign: TextAlign.start),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      floatingActionButton: CircleAvatar(
        radius: SizeConfig.isTablet ? 25 : 30,
        backgroundColor: Theme.of(context).primaryColor,
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            SimpleLineIcons.refresh,
            color: whiteC,
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              AntDesign.left,
              color: whiteC,
            )),
        title: Text("Live Share"),
        actions: [
          IconButton(
              icon: Icon(
                Icons.timer,
                color: whiteC,
              ),
              onPressed: () {})
        ],
        elevation: 0.0,
      ),
      body: Column(
        children: [
          _buildTitleRow(),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(
                      50,
                      (index) => _builtTableChild(
                          theme: _theme,
                          per: 1,
                          diff: 1.04,
                          open: '475',
                          symbol: 'ADBL',
                          high: '484',
                          low: '475',
                          ltp: '484',
                          previousClose: '479',
                          quantity: '86382')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
