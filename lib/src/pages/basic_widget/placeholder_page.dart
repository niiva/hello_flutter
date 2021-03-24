import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class PlaceholderPage extends StatefulWidget {
  @override
  _PlaceholderPageState createState() => _PlaceholderPageState();
}

class _PlaceholderPageState extends State<PlaceholderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Placeholder Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: 'Placeholder',
            subTitles: [
              '占位组件',
              'color颜色',
              'strokeWidth线条宽度',
              '暂时没想到有什么用处',
            ],
            child: Container(
              width: 50,
              height: 50,
              child: Placeholder(
                color: Colors.green,
                strokeWidth: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
