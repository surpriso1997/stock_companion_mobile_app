import 'package:flutter/cupertino.dart';

class Navigation {
  static GlobalKey _navigatorKey = GlobalKey<NavigatorState>();

  static get navigationKey => _navigatorKey;
  static BuildContext get context => _navigatorKey.currentContext;

  static Navigation _instance = Navigation._private();

  factory Navigation() {
    return _instance;
  }
  Navigation._private();
}
