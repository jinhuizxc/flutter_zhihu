import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_zhihu/component/cell/CommonCell.dart';


class SettingPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("设置"),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            color: Colors.white,
            height: 55.0,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: <Widget>[
                Text('设置1', style: TextStyle(fontSize: 20.0),),
                Expanded(child: Container()),
                CupertinoSwitch(
                    value: false,
                    onChanged: (bool value){})
              ],
            ),
          ),
          new Container(
            color: Colors.white,
            height: 55.0,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: <Widget>[
                Text('设置2', style: TextStyle(fontSize: 20.0),),
                Expanded(child: Container(),),
                CupertinoSwitch(
                    value: true,
                    onChanged: (bool value){},
                    )
              ],
            ),
          ),
          SizedBox(
            height: 18.0,
          ),
          CommonCell(
            title:"清除缓存",
            subtitle: '3MB',
            onPressed: (){
              print("点击事件: 测试打印消息");
            },
          )
        ],
      ),
    );
  }
}