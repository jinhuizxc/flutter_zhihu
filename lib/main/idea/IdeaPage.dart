import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_zhihu/main/idea/IdeaHeader.dart';
import 'package:flutter_zhihu/main/idea/IdeaList.dart';
import 'package:flutter_zhihu/model/idea.dart';
import 'package:flutter_zhihu/model/topic.dart';
import 'package:flutter_zhihu/network/Request.dart';
import 'package:flutter_zhihu/utils/ScreenUtil.dart';


class IdeaPage extends StatefulWidget {
  @override
  _IdeaPageState createState() => _IdeaPageState();
}

class _IdeaPageState extends State<IdeaPage> {
  double navAlpha = 0.0;
  ScrollController scrollController = ScrollController();

  List<Topic> topics = [];
  List<Idea> ideas = [];

  @override
  void initState() {
    fetchData();
    scrollController.addListener(() {
      var offset = scrollController.offset;
      if (offset < 0) {
        if (navAlpha != 0) {
          setState(() {
            navAlpha = 0.0;
          });
        }
      } else if (offset < 50) {
        setState(() {
          navAlpha = 1 - (50 - offset) / 50;
        });
      } else if (navAlpha != 1) {
        setState(() {
          navAlpha = 1.0;
        });
      }
    });
  }

  Future<void> fetchData() async {

    var responseJson = await Request.get(action: 'idea_topic');

    List topicJson = responseJson['topic'];
    List ideaJson = responseJson['idea'];

    List<Topic> topics = [];
    topicJson.forEach((data) {
      topics.add(Topic.fromJson(data));
    });

    List<Idea> ideas = [];
    ideaJson.forEach((data) {
      ideas.add(Idea.fromJson(data));
    });

    setState(() {
      this.topics = topics;
      this.ideas = ideas;
    });
  }

  Widget buildActions(Color iconColor) {
    return Row(children: <Widget>[]);
  }

  Widget buildNavigationBar() {
    return Stack(
      children: <Widget>[
        Positioned(
          right: 0.0,
          child: Container(
            margin:
            EdgeInsets.fromLTRB(5.0, ScreenUtil.statusBarHeight(context), 0.0, 0.0),
            child: buildActions(Colors.white),
          ),
        ),
        Opacity(
          opacity: navAlpha,
          child: Container(
            padding:
            EdgeInsets.fromLTRB(5.0, ScreenUtil.statusBarHeight(context), 0.0, 0.0),
            height: ScreenUtil.navigationBarHeight(context),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    '想法',
                    style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                buildActions(Colors.black38),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        RefreshIndicator(
          child: ListView(
            controller: scrollController,
            children: <Widget>[
              IdeaHeader(topics: topics,),
              IdeaList(ideas: ideas,)
            ],
          ),
          onRefresh: fetchData,
        ),
        buildNavigationBar(),
      ]),
    );
  }
}
