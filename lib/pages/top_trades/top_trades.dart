import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/top_trades/top_trades_blocs.dart';

import 'widgets/widgets.dart';

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

    BlocProvider.of<GainersBloc>(context).add(FetchItems());
    BlocProvider.of<LosersBloc>(context).add(FetchItems());
    BlocProvider.of<TurnoverBloc>(context).add(FetchItems());
    BlocProvider.of<SharesTradedBloc>(context).add(FetchItems());
    BlocProvider.of<TransactionsBloc>(context).add(FetchItems());
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
      body: TabBarView(
        // itemCount: _tabsTitles.length,
        controller: _tabController,
        // onPageChanged: (index) {
        //   _tabController.animateTo(index,
        //       duration: kTabScrollDuration, curve: Curves.easeIn);
        // },

        children: [
          Gainers(),
          Losers(),
          Turnover(),
          SharesTraded(),
          Transactions(),
          Brokers(),
        ],
      ),
    );
  }
}
