import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:stock_companion/data/provider/api.dart';
import 'package:stock_companion/data/provider/database.dart';
import 'package:stock_companion/pages/news/news.dart';
import 'package:stock_companion/pages/pages.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    openDatabasee();
    someRAndom();
  }

  someRAndom() async {
    // await postRequest();
  }

  openDatabasee() async {
    var db = await DbHelper().db;
  }

  Widget _buildBottomNavItem(int index, {IconData icon, String text}) {
    var theme = Theme.of(context);

    var color =
        _currentIndex == index ? theme.textSelectionColor : Colors.white;
    return InkWell(
      onTap: () => _onPressItem(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Text(text, style: TextStyle(color: color))
        ],
      ),
    );
  }

  PageController _pageController = PageController();

  Widget _pages() {
    return PageView.builder(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return Market();
            break;
          case 1:
            return Dashboard();
            break;
          case 2:
            return News();
            break;

          default:
            return Container();
            break;
        }
      },
      // children: [
      //   Market(),
      //   News(),
      //   Dashboard(),
      //   Wishlist(),
      //   More(),
      // ],
    );
  }

  _onPressItem(index) {
    _currentIndex = index;
    _pageController.jumpToPage(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: _pages(),
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight,
        color: theme.bottomNavigationBarTheme.backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildBottomNavItem(0,
                icon: MaterialCommunityIcons.google_analytics, text: "Market"),
            _buildBottomNavItem(1, icon: Icons.dashboard, text: "Dashboard"),
            _buildBottomNavItem(2, icon: Entypo.news, text: "News"),
          ],
        ),
      ),
    );
  }
}
