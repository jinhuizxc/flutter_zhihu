import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_zhihu/main/campus/detail/RecommendListItem.dart';
import 'package:flutter_zhihu/model/Recommend.dart';
import 'package:flutter_zhihu/network/Request.dart';

class MyHomeListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomeListViewState();
  }
}

class _MyHomeListViewState extends State<MyHomeListView> {
  List<Recommend> modules = [];
  int page = 1;
  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false;

  Future<void> fetchData() async {
    var responseJson = await Request.get(action: "myhome_recommend");
    List<Recommend> modules = [];
    responseJson.forEach((data) {
      modules.add(Recommend.fromJson(data));
    });

    setState(() {
      this.modules = modules;
      page = 1;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (page < 3) {
          _getMoreData();
          print("加载更多数据");
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: fetchData,
      child: ListView.builder(
        itemCount: modules.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < modules.length) {
            return buildModule(context, modules[index]);
          } else {
            return _buildProgressIndicator();
          }
        },
        controller: _scrollController,
      ),
    );
  }

  Widget buildModule(BuildContext context, Recommend module) {
    return RecommendListItem(
      recommend: module,
    );
  }

  Widget _buildProgressIndicator() {
    print("page:" + page.toString());
    if (page < 3) {
      return new Padding(
        padding: const EdgeInsets.all(18.0),
        child: new Center(
          child: new Opacity(
            opacity: isPerformingRequest ? 1.0 : 0.0,
            child: new CircularProgressIndicator(),
          ),
        ),
      );
    } else {
      return haveNoMore();
    }
  }

  Future<List<Recommend>> fakeRequest() async {
    var responseJson = await Request.get(action: "myhome_recommend");
    List<Recommend> modules = [];
    responseJson.forEach((data) {
      modules.add(Recommend.fromJson(data));
    });
    return Future.delayed(Duration(seconds: 1), () {
      return modules;
    });
  }

  void _getMoreData() async {
    if (!isPerformingRequest) {
      setState(() => isPerformingRequest = true);
      List<Recommend> newEntries = await fakeRequest(); //returns empty list
      if (newEntries.isEmpty) {
        double edge = 50.0;
        double offsetFromBottom = _scrollController.position.maxScrollExtent -
            _scrollController.position.pixels;
        if (offsetFromBottom < edge) {
          _scrollController.animateTo(
              _scrollController.offset - (edge - offsetFromBottom),
              duration: new Duration(milliseconds: 500),
              curve: Curves.easeOut);
        }
      }
      setState(() {
        modules.addAll(newEntries);
        isPerformingRequest = false;
        page++;
      });
    }
  }

  Widget haveNoMore() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 18.0, bottom: 30.0),
          child: Text(
            "没有更过内容了，去别的地方看看吧(^_^)",
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          ),
        )
      ],
    );
  }
}
