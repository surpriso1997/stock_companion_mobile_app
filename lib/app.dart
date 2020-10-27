import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:stock_companion/utils/app_config.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      title: AppConfig.of(context).appName,
      theme: ThemeData(),
      home: Container(),
    );
  }
}
