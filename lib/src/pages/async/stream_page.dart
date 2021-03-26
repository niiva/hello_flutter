import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StreamPage extends StatefulWidget {
  @override
  _StreamPageState createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Page'),
      ),
      body: WebView(
        initialUrl:
            'https://www.jindu.link/2021/03/26/Dart%E4%B8%AD%E7%9A%84%E5%BC%82%E6%AD%A5/#Stream',
      ),
    );
  }
}
