import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:stock_companion/utils/app_config.dart';

import 'app.dart';
import './utils/utils.dart';

void main() {
  var configApp = AppConfig(
    appName: "Stock Companion DEV",
    flavor: "dev",
    baseUrl: Constants.base_url_dev,
    secondaryBaseUrl: Constants.secondary_base_url_dev,
    child: MyApp(),
  );

  runApp(configApp);
  // runApp(DevicePreview(builder: (context) => configApp));
}
