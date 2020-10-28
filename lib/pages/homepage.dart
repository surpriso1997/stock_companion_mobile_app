import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  BottomNavigationBarItem _buildBottomNavItem({IconData icon, String text}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
      items: [
        _buildBottomNavItem(
            icon: MaterialCommunityIcons.google_analytics, text: "Market"),
        _buildBottomNavItem(icon: Entypo.news, text: "News"),
        _buildBottomNavItem(icon: Icons.dashboard, text: "Dashboard"),
        _buildBottomNavItem(icon: Icons.favorite_outline, text: "Wishlist"),
        _buildBottomNavItem(icon: Feather.menu, text: "More")
      ],
    ));
  }
}
