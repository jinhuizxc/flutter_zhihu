import 'package:flutter/material.dart';
import 'package:flutter_zhihu/model/Message.dart';
import 'package:flutter_zhihu/utils/ScreenUtil.dart';

class MessageList extends StatelessWidget {

  List<Message> messages;

  MessageList({Key key, this.messages});

  @override
  Widget build(BuildContext context) {
    var children = messages
        .map((item) => MessageItem(
              message: item,
            ))
        .toList();

    return Column(
      children: children,
    );
  }
}

// 设置消息列表item
class MessageItem extends StatelessWidget {

  final Message message;

  const MessageItem({Key key, this.message}) : super(key: key);

  //    padding: const EdgeInsets.all(8.0),
  //   padding: const EdgeInsets.only(top: 8.0),
  // 导致A RenderFlex overflowed by 48 pixels on the right
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
          Padding(
//            padding: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.only(top: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(
                (message.type == 1)
                    ? Icons.favorite
                    : (message.type == 2) ? Icons.message : Icons.access_alarm,
                color: Colors.white,
              ),
              radius: 22.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  (message.type == 1) ? "赞同" : (message.type == 2) ? "消息" : "闹钟",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  message.username + " 通知了您",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Container(
                  width: ScreenUtil.width(context) * 0.8,
                  child: Text(
                    this.message.content,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Text(
                  "12天前",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
