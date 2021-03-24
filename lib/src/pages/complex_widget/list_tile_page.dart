import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';
import 'package:toast/toast.dart';

class ListTilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListTile Page'),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.arrow_left),
              title: Text('这里是title'),
              subtitle: Text('这里是subTitle'),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Toast.show(
                  '点击了列表',
                  context,
                  duration: Toast.LENGTH_LONG,
                  gravity: Toast.BOTTOM,
                );
              },
              onLongPress: () {
                Toast.show(
                  '长按了列表',
                  context,
                  duration: Toast.LENGTH_LONG,
                  gravity: Toast.BOTTOM,
                );
              },
            ),
          ),
          Column(
            children: [
              DDDDescText(
                textList: [
                  'ListTile是一个官方封装的ListCell',
                  'leading左边小箭头<Widget>',
                  'title右边小箭头<Widget>',
                  'subtitle标题<Widget>',
                  'trailing副标题<Widget>',
                  'onTap点击事件',
                  'onLongPress长按事件',
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
