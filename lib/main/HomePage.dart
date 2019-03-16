import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zhihu/main/campus/CampusPage.dart';
import 'package:flutter_zhihu/main/home/MyHomePage.dart';
import 'package:flutter_zhihu/main/idea/IdeaPage.dart';
import 'package:flutter_zhihu/main/me/MyPage.dart';
import 'package:flutter_zhihu/main/message/MessagePage.dart';

class HomePage extends StatefulWidget {
  static String tag = "home-page";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int tabIndex = 0;
  bool isFinishSetUp = false;
  // 设置底部图片
  List<Icon> tabUnSelectImages = [
    Icon(Icons.view_list, size: 25.0, color: Colors.grey),
    Icon(Icons.touch_app, size: 25.0, color: Colors.grey),
    Icon(Icons.school, size: 25.0, color: Colors.grey),
    Icon(Icons.notifications, size: 25.0, color: Colors.grey),
    Icon(Icons.person, size: 25.0, color: Colors.grey),
  ];

  List<Icon> tabSelectImages = [
    Icon(Icons.view_list, size: 25.0, color: Colors.blue),
    Icon(Icons.touch_app, size: 25.0, color: Colors.blue),
    Icon(Icons.school, size: 25.0, color: Colors.blue),
    Icon(Icons.notifications, size: 25.0, color: Colors.blue),
    Icon(Icons.person, size: 25.0, color: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: IndexedStack(
        children: <Widget>[
          MyHomePage(),
          IdeaPage(),
          CampusPage(),
          MessagePage(),
          MyPage(),
        ],
        index: tabIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: Colors.teal,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0), title: Text("首页")),
          BottomNavigationBarItem(icon: getTabIcon(1), title: Text("想法")),
          BottomNavigationBarItem(icon: getTabIcon(2), title: Text("大学")),
          BottomNavigationBarItem(icon: getTabIcon(3), title: Text("消息")),
          BottomNavigationBarItem(icon: getTabIcon(4), title: Text("我")),
        ],
        currentIndex: tabIndex,
        onTap: (index){
          setState(() {
            tabIndex = index;
          });
        },
      ),
    );
  }

  // 获得组件icon
  Icon getTabIcon(int index) {
    if(index == tabIndex){
      return tabSelectImages[index];
    }else {
      return tabUnSelectImages[index];
    }
  }
}
