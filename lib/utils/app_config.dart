import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  final String appName;
  final String flavor;
  final String baseUrl;
  final String secondaryBaseUrl;
  final Widget child;

  AppConfig(
      {this.appName,
      this.flavor,
      this.baseUrl,
      this.secondaryBaseUrl,
      this.child})
      : super(child: child);

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
