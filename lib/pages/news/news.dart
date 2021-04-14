import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/bloc/news_cubit/news_cubit.dart';
import 'package:stock_companion/models/news.dart';
import 'package:stock_companion/utils/utils.dart';
import 'package:stock_companion/widgets/fucntional_widgets.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    BlocProvider.of<NewsBloc>(context).add(FetchItems());
  }

  _buildNewsItem(NewsModel newsItem) {
    return InkWell(
      onTap: () async {
        if (await launcher.canLaunch(newsItem.url)) {
          launcher.launch(newsItem.url);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              newsItem.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            Text(newsItem.date),
            SizedBox(height: 10),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Image.network(newsItem.image, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }

  List _sites = ["Share sansar", "Mero lagani", "Nepali Paisa"];
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("All News"),
        // bottom: TabBar(
        //   isScrollable: true,
        //   indicatorColor: _theme.textSelectionColor,
        //   indicatorSize: TabBarIndicatorSize.tab,
        //   indicatorWeight: 2.0,
        //   labelStyle: TextStyle(fontSize: 20),
        //   controller: _tabController,
        //   labelPadding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        //   tabs: [
        //     Text("Share Sansar"),
        //     Text("Mero lagani"),
        //     Text("Nepali Paisa"),
        //   ],
        // ),
      ),
      body: SafeArea(
        top: true,
        child: Container(
            color: Colors.grey.withOpacity(0.3),
            child: Column(
              children: [
                Flexible(
                  child: BlocBuilder<NewsBloc, CommonState>(
                    builder: (context, state) {
                      if (state is FetchingItemsState) {
                        return progressIndicator();
                      } else if (state is ErrorState) {
                        return Text(
                          state.message ?? "An error occurred",
                          style: TextStyle(color: blackC, fontSize: 18),
                        );
                      } else if (state is FetchedItemsState) {
                        List<List<NewsModel>> lists = state.items;
                        return PageView.builder(
                          itemCount: lists.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, pageViewIndex) {
                            List<NewsModel> news = lists[pageViewIndex];
                            return Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  decoration:
                                      BoxDecoration(color: Colors.orange),
                                  child: Text(
                                    _sites[pageViewIndex],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Flexible(
                                  child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    itemCount: lists[pageViewIndex].length,
                                    itemBuilder: (context, newsIndex) {
                                      var aNews = news[newsIndex];
                                      return _buildNewsItem(aNews);
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } else
                        return Container();
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
