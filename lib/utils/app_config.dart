import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  final String appName;
  final String flavor;
  final String baseUrl;
  final String secondaryBaseUrl;
  final Widget child;

  AppConfig(
      {required this.appName,
      required this.flavor,
      required this.baseUrl,
      required this.secondaryBaseUrl,
      required this.child})
      : super(child: child);

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
