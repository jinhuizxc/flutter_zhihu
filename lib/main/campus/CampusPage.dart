import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_zhihu/main/campus/detail/MyHomeListView.dart';


class CampusPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _CampusPageState();
}

class _CampusPageState extends State<CampusPage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  // vsync: this出错需要with SingleTickerProviderStateMixin
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 0, length: 2);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    ///页面销毁时，销毁控制器
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('flutter', style: TextStyle(
                color: Colors.deepOrange,
              ),
            ),
            Text('name', style: TextStyle(
              fontSize: 16.0, color: Colors.blue
            ),),
          ],
        ),
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 25.0,
            backgroundImage: CachedNetworkImageProvider(
                "https://avatars0.githubusercontent.com/u/24784194?s=460&v=4"),
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.filter_frames,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          )
        ],
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          tabs: <Widget>[
            new Tab(text: "课堂"),
            new Tab(text: "读书会"),
          ],
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          MyHomeListView(),
          MyHomeListView(),
        ],
      ),
    );
  }
}