import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/services/services.dart';
import 'package:news_app/widget/news_item.dart';

class TabBarMenu extends StatefulWidget {
  final List<Article> article;

  const TabBarMenu({Key? key, required this.article}) : super(key: key);

  @override
  _TabBarMenuState createState() => _TabBarMenuState();
}

class _TabBarMenuState extends State<TabBarMenu>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Tab> myTab = [
    Tab(
      text: 'Business',
    ),
    Tab(
      text: 'Entertainment',
    ),
    Tab(
      text: 'General',
    ),
    Tab(
      text: 'Health',
    ),
    Tab(
      text: 'Science',
    ),
    Tab(
      text: 'Sports',
    ),
    Tab(
      text: 'Technology',
    )
  ];

  //untuk mengatur perubahan data
  @override
  void initState() {
    _tabController = TabController(length: myTab.length, vsync: this);
    super.initState();
  }

  //saat perpindahan tab, tab yang sebelumnya di hilangkan
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var news = News();
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: myTab,
            labelColor: Colors.deepOrangeAccent,
            unselectedLabelColor: Colors.black,
            isScrollable: true,
            indicator: BubbleTabIndicator(
                indicatorColor: Colors.black,
                indicatorHeight: 30,
                tabBarIndicatorSize: TabBarIndicatorSize.tab),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: myTab.map((Tab tab) {
                    return FutureBuilder(
                        future: news.getNewsByCategory(tab.text.toString()),
                        builder: (context, snapshot) => snapshot.data != null
                            ? _listNewsCategory(snapshot.data as List<Article>)
                            : Center(child: CircularProgressIndicator()));
                  }).toList()))
        ],
      ),
    );
  }

  Widget _listNewsCategory(List<Article> article) {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListView.builder(
        itemBuilder: (context, index) => NewsItem(article: article[index]),
        itemCount: article.length,
      ),
    );
  }
}
