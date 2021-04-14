import 'package:stock_companion/data/provider/api.dart';
import 'package:stock_companion/models/news.dart';
import 'package:stock_companion/pages/news/news.dart';
import 'package:stock_companion/utils/utils.dart';

class INewsRepoesitory {
  final _url = "http://13.76.102.39/news";

  List<NewsModel> _news = [];
  List<NewsModel> get news => _news;

  Future<List<NewsModel>> getNews(String provider) async {
    try {
      List res = await getRequest(url: "$_url/$provider");
      if (res.isNotEmpty) {
        final data = res.map<NewsModel>((e) => NewsModel.fromJson(e)).toList();
        return data;
      }
    } on CustomApiExcception catch (e) {
      throw ApiException(message: e.message);
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
