import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:stock_companion/utils/utils.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    _buildGridViewItem({String title, IconData icon, Function onPressed}) {
      return InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).textSelectionColor,
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(width: 1, color: Theme.of(context).primaryColor),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor,
                  offset: Offset(3, 3),
                  spreadRadius: 0.5,
                  blurRadius: 2.0,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 35, color: Theme.of(context).primaryColor),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
        ),
      );
    }

    return SafeArea(
      top: true,
      child: GridView(
        // itemCount: 10,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.93,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        // itemBuilder: (context, index) {
        //   return Container(
        //       child: Column(
        //     children: [Icon(Icons.home), Text("My Portfolio")],
        //   ));
        // },

        children: [
          _buildGridViewItem(
              icon: Icons.business_center,
              title: 'My Portfolio',
              onPressed: () {}),
          _buildGridViewItem(
              icon: MaterialCommunityIcons.timer_sand,
              title: 'Live Nepse',
              onPressed: () {
                Navigator.pushNamed(context, Routes.live_marekt);
              }),
          _buildGridViewItem(
              icon: AntDesign.barchart,
              title: 'Top Trades',
              onPressed: () {
                Navigator.pushNamed(context, Routes.top_trades_page);
              }),
          _buildGridViewItem(
              icon: Entypo.line_graph, title: 'Stock Price', onPressed: () {}),
          _buildGridViewItem(
              icon: Icons.analytics,
              title: 'Floorsheet',
              onPressed: () {
                Navigator.pushNamed(context, Routes.floorsheet);
              }),
          _buildGridViewItem(
              icon: AntDesign.piechart,
              title: 'Market Indices',
              onPressed: () {}),
          _buildGridViewItem(
              icon: Feather.target, title: 'Market Depth', onPressed: () {}),
          _buildGridViewItem(
              icon: AntDesign.eyeo, title: 'Watchlist', onPressed: () {}),
          _buildGridViewItem(
              icon: Icons.notification_important_outlined,
              title: 'Stock Alert',
              onPressed: () {}),
          _buildGridViewItem(
              icon: SimpleLineIcons.notebook, title: 'Notes', onPressed: () {}),
          _buildGridViewItem(
              icon: MaterialIcons.next_week,
              title: 'Proposed',
              onPressed: () {}),
          _buildGridViewItem(
              icon: MaterialCommunityIcons.door,
              title: 'Openings',
              onPressed: () {}),
          _buildGridViewItem(
              icon: Feather.globe, title: 'SEBON Issues', onPressed: () {}),
          _buildGridViewItem(
              icon: Icons.forum, title: 'Forum', onPressed: () {}),
          _buildGridViewItem(
              icon: Icons.new_releases, title: 'News', onPressed: () {}),
          _buildGridViewItem(
              icon: FontAwesome.mortar_board,
              title: 'Stock Education',
              onPressed: () {}),
          _buildGridViewItem(
              icon: AntDesign.notification, title: 'Notices', onPressed: () {}),
          _buildGridViewItem(
              icon: FontAwesome.handshake_o,
              title: 'Mero Share',
              onPressed: () {}),
          _buildGridViewItem(
              icon: MaterialCommunityIcons.ring,
              title: 'Gold Silver',
              onPressed: () {}),
          _buildGridViewItem(
              icon: Feather.dollar_sign,
              title: 'Exchange Rates',
              onPressed: () {}),
          _buildGridViewItem(
              icon: FontAwesome.institution,
              title: 'Listed Stocks',
              onPressed: () {
                Navigator.pushNamed(context, Routes.companies_list);
              }),
          _buildGridViewItem(
              icon: MaterialCommunityIcons.office_building,
              title: 'Listed Brokers',
              onPressed: () {}),
          _buildGridViewItem(
              icon: Icons.calculate,
              title: 'Calculator',
              onPressed: () {
                Navigator.pushNamed(context, Routes.calculator);
              }),
        ],
      ),
    );
  }
}

class DashboardItem {
  final String title;
  final IconData icon;
  final String routeName;
  const DashboardItem({this.title, this.icon, this.routeName});
}
