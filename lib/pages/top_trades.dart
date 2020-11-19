import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:stock_companion/utils/utils.dart';
import 'package:stock_companion/widgets/fucntional_widgets.dart';

class TopTrades extends StatefulWidget {
  @override
  _TopTradesState createState() => _TopTradesState();
}

class _TopTradesState extends State<TopTrades>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  TabController _tabController;

  final List<String> _tabsTitles = [
    'Gainers',
    'Losers',
    'Turnover',
    'Shares Traded',
    'Transactions',
    'Brokers'
  ];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, initialIndex: 0, length: _tabsTitles.length);
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Top lists"),
        bottom: TabBar(
            isScrollable: true,
            indicatorColor: _theme.textSelectionColor,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2.0,
            labelStyle: TextStyle(fontSize: 18),
            controller: _tabController,
            labelPadding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            tabs: [
              ...List.generate(
                  _tabsTitles.length, (index) => Text(_tabsTitles[index]))
            ]),
      ),
      body: PageView.builder(
        itemCount: _tabsTitles.length,
        controller: _pageController,
        onPageChanged: (index) {
          _tabController.animateTo(index,
              duration: kTabScrollDuration, curve: Curves.easeIn);
        },
        itemBuilder: (context, index) => Container(
          child: Column(
            children: [
              Container(
                color: blackC,
                height: 40,
                child: PaddingChild(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TableTitleText('SY'),
                      TableTitleText("LTP"),
                      TableTitleText("+/-"),
                      TableTitleText("%"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabViewBodyItem extends StatefulWidget {
  @override
  _TabViewBodyItemState createState() => _TabViewBodyItemState();
}

class _TabViewBodyItemState extends State<TabViewBodyItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          buildFloatingActionButton(onPressed: () {}, context: context),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
              children: List.generate(10, (index) {
            return Container(
              child: Row(children: [
                Text('ADBL'),
                Text('200'),
                Text('150'),
                Text('2.1'),
                Text('1.1'),
              ]),
            );
          })),
        ),
      ),
    );
  }
}

class PaddingChild extends StatelessWidget {
  final Widget child;
  final double horizontal;
  final double vertical;
  const PaddingChild({Key key, this.child, this.horizontal, this.vertical})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontal ?? symmetricHzPadding,
          vertical: vertical ?? 0.0),
      child: child,
    );
  }
}

class TableTitleText extends StatelessWidget {
  final String _text;
  final TextStyle _textStyle;
  final TextAlign _textAlign;
  const TableTitleText(String text, {TextStyle style, TextAlign textAlign})
      : _text = text,
        _textStyle = style,
        _textAlign = textAlign;

  @override
  Widget build(BuildContext context) {
    var headingStyle = Theme.of(context).dataTableTheme.headingTextStyle;
    return Text(
      _text,
      textAlign: _textAlign ?? TextAlign.center,
      style: _textStyle ?? headingStyle,
    );
  }
}
