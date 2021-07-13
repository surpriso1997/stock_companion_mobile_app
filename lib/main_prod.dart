import 'package:flutter/cupertino.dart';
import 'package:stock_companion/utils/app_config.dart';

import 'app.dart';
import './utils/utils.dart';

void main() {
  var configApp = AppConfig(
      appName: "Stock Companion",
      flavor: "prod",
      baseUrl: Constants.base_url_prod,
      secondaryBaseUrl: Constants.secondary_base_url_prod,
      child: MyApp());

  runApp(configApp);
}
