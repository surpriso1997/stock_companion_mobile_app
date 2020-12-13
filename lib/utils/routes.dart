import 'package:stock_companion/pages/floorsheet.dart';
import 'package:stock_companion/pages/pages.dart';

class Routes {
  static const splash_page = "splash_page";
  static const market_page = "market_page";
  static const news_page = "news_page";
  static const wishlist_page = "wishlist_page";
  static const more_page = "more_page";
  static const live_marekt = 'live_market';
  static const company_page = 'company_page';
  static const top_trades_page = 'top_trades_page';
  static const floorsheet = 'floorsheet';

  static var routes = {
    splash_page: (context) => Splash(),
    market_page: (context) => Market(),
    news_page: (context) => News(),
    wishlist_page: (context) => Wishlist(),
    more_page: (context) => More(),
    live_marekt: (context) => LiveMarket(),
    company_page: (context) => Company(),
    top_trades_page: (context) => TopTrades(),
    floorsheet: (context) => Floorsheet()
  };
}
