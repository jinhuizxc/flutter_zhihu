import 'package:flutter/material.dart';
import 'package:flutter_zhihu/component/cell/MeCell.dart';
import 'package:flutter_zhihu/main/me/MyHeader.dart';
import 'package:flutter_zhihu/main/me/SettingPage.dart';
import 'package:flutter_zhihu/utils/AppNavigator.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: barSearch(),
        elevation: 0.0, // 设置阴影
      ),
      body: Container(
          child: ListView(
        children: <Widget>[
          MyHeader(),
          SizedBox(height: 12.0),
          buildItems(context),
          SizedBox(height: 12.0),
          buildItems2(context),
          videoCard(context)
        ],
      )),
    );
  }

  // appBar显示部分
  Widget barSearch() {
    return new Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: new FlatButton.icon(
                color: Colors.black12,
                onPressed: () {},
                icon: new Icon(Icons.search, color: Colors.grey, size: 18.0),
                label: new Text(
                  "搜索知乎内容",
                  style: new TextStyle(color: Colors.grey, fontSize: 16.0),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.crop_free,
            color: Colors.grey,
            size: 32.0,
          ),
        )
      ],
    );
  }

  Widget buildItems(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        children: <Widget>[
          // 构建GridView
          MeCell(title: '学习记录',
              icon: Icons.school,
              onPressed: () {}),
          MeCell(title: '已购',
              icon: Icons.shop,
              onPressed: () {}),
          MeCell(title: '余额礼券',
              icon: Icons.school,
              onPressed: () {}),
          MeCell(title: '读书会',
              icon: Icons.book,
              onPressed: () {}),
          MeCell(
              title: '我的书架',
              icon: Icons.collections_bookmark,
              onPressed: () {}),
          MeCell(
              title: '下载中心',
              icon: Icons.collections_bookmark,
              onPressed: () {}),
          MeCell(
              title: '付费咨询',
              icon: Icons.collections_bookmark,
              onPressed: () {}),
          MeCell(
              title: '活动广场',
              icon: Icons.collections_bookmark,
              onPressed: () {}),
        ],
      ),
    );
  }

  Widget buildItems2(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView.count(
          crossAxisCount: 4,
        shrinkWrap: true,
        children: <Widget>[
          MeCell(
            title: "社区建设",
            icon: Icons.add_photo_alternate,
            onPressed: (){},
          ),
          MeCell(
            title: "反馈与帮助",
            icon: Icons.more,
            onPressed: (){},
          ),
          MeCell(
            title: "设置",
            icon: Icons.confirmation_number,
            onPressed: (){
              // 点击跳转，路由
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return SettingPage();
              }));
            },
          ),
          MeCell(
            title: "Github",
            icon: Icons.person,
            onPressed: (){
              AppNavigator.pushWeb(
                context, 'https://github.com/jinhuizxc', 'github');
            },
          )
        ],
      ),
    );
  }

  // 视频创作模块
  Widget videoCard(BuildContext context) {
    return new Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
      child: Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(left: 16.0, bottom: 20.0),
            child: new Row(
              children: <Widget>[
                new Container(
                  child: new CircleAvatar(
                    radius: 16.0,
                    child: new Icon(Icons.videocam, color: Colors.white),
                    backgroundColor: Colors.green,
                  ),
                ),
                new Expanded(
                  child: new Container(
                    margin: const EdgeInsets.only(left: 8.0),
                    child: new Text("视频创作", style: new TextStyle(fontSize: 16.0),),
                  ),
                ),
                new Container(
                  child: new FlatButton(
                      onPressed: (){
                        print('点击事件: 拍一个按钮被点击');
                      },
                      child: Row(
                        children: <Widget>[
                          new Text("拍一个", style: new TextStyle(color: Colors.grey),),
                          Icon(Icons.arrow_forward_ios, color: Colors.grey,size: 16.0,)
                        ],
                      )
                  ),
                )
              ],
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(left: 16.0),
            child: new SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  new Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    margin: const EdgeInsets.only(right: 6.0),
                    child: new AspectRatio(
                      aspectRatio: 4.0 / 2.0,
                        child: new Container(
                          foregroundDecoration:new BoxDecoration(
                              image: new DecorationImage(
                                image: new NetworkImage("https://img1.sycdn.imooc.com/szimg/5c7e6835087ef3d806000338.jpg"),
                                centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                              ),
                              borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                          ),
                        )
                    ),
                  ),
                  new Container(
                    margin: const EdgeInsets.only(right: 6.0),
                    width: MediaQuery.of(context).size.width / 2.5,
                      child: new AspectRatio(
                          aspectRatio: 4.0 / 2.0,
                          child: new Container(
                            foregroundDecoration:new BoxDecoration(
                                image: new DecorationImage(
                                  image: new NetworkImage("https://img2.sycdn.imooc.com/szimg/5c18d2d8000141c506000338.jpg"),
                                  centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                                ),
                                borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                            ),
                          )
                      )
                  ),
                  new Container(
                      margin: const EdgeInsets.only(right: 6.0),
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: new AspectRatio(
                          aspectRatio: 4.0 / 2.0,
                          child: new Container(
                            foregroundDecoration:new BoxDecoration(
                                image: new DecorationImage(
                                  image: new NetworkImage("https://img4.sycdn.imooc.com/szimg/5b3082da0001d7e905400300.jpg"),
                                  centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                                ),
                                borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                            ),
                          )
                      )
                  ),
                  new Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: new AspectRatio(
                          aspectRatio: 4.0 / 2.0,
                          child: new Container(
                            foregroundDecoration:new BoxDecoration(
                                image: new DecorationImage(
                                  image: new NetworkImage("https://img1.sycdn.imooc.com/szimg/5c3ef588088403df06000338.jpg"),
                                  centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                                ),
                                borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                            ),
                          )
                      )
                  ),
                ],
              ),
            ),


          )
        ],
      ),
    );
  }
}
