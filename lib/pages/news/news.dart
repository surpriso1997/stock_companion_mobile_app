import 'package:flutter/material.dart';
import 'package:stock_companion/models/news.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  _buildNewsItem(NewsModel newsItem) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Biggest Ipo in Nepal coming worth 9 billion rupees. ",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text("3 hours ago"),
          SizedBox(height: 10),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(icon: Icon(Icons.arrow_upward), onPressed: () {}),
                  Text("-5"),
                  IconButton(icon: Icon(Icons.arrow_upward), onPressed: () {}),
                ],
              ),
              IconButton(icon: Icon(Icons.share_outlined), onPressed: () {})
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("All News"),
        bottom: TabBar(
          isScrollable: true,
          indicatorColor: _theme.textSelectionColor,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 2.0,
          labelStyle: TextStyle(fontSize: 20),
          controller: _tabController,
          labelPadding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          tabs: [
            Text("Mero lagani"),
            Text("Share Sansar"),
            Text("Nepali Paisa"),
            Text("Biz Mandu"),
          ],
        ),
      ),
      body: SafeArea(
        top: true,
        child: Container(
            color: Colors.grey.withOpacity(0.3),
            child: Column(
              children: [
                // Container(
                //     width: MediaQuery.of(context).size.width,
                //     margin: EdgeInsets.symmetric(horizontal: 10),
                //     padding: EdgeInsets.symmetric(
                //       vertical: 20,
                //     ),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       color: Theme.of(context).primaryColor,
                //     ),p
                //     child: Text(
                //       "Desclaimer",
                //       textAlign: TextAlign.center,
                //       style: TextStyle(
                //           color: Theme.of(context).textSelectionColor,
                //           fontSize: 18,
                //           decoration: TextDecoration.underline),
                //     )),
                Flexible(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return _buildNewsItem(NewsModel());
                      }),
                ),
              ],
            )),
      ),
    );
  }
}
