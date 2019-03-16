import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebPage extends StatefulWidget {
  String url;
  String title;

  WebPage({this.url, this.title});

  @override
  State<StatefulWidget> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: this.widget.url,
      appBar: new AppBar(
        title: Text(this.widget.title ?? 'YourName'),
        backgroundColor: Colors.white,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Share.share(this.widget.url);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.share),
            ),
          )
        ],
      ),
    );
  }
}
