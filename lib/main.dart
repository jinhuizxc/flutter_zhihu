import 'package:flutter/material.dart';
import 'package:flutter_zhihu/main/HomePage.dart';


// 开发知乎App的Flutter版。技术栈：flutter+redux+sqflite。
// https://github.com/MeandNi/Flutter_ZhiHu


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ZhiHu',
      theme: new ThemeData(
//        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
      ),
      home: HomePage(),
    );
  }


}
