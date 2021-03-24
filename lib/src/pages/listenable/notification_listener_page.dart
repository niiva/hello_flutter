import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class NotificationListenerPage extends StatefulWidget {
  @override
  _NotificationListenerPageState createState() =>
      _NotificationListenerPageState();
}

class _NotificationListenerPageState extends State<NotificationListenerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotificationListener Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: 'title',
            subTitles: ['subTitles'],
            child: Container(),
          ),
        ],
      ),
    );
  }
}
