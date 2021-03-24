import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class ScrollBarPage extends StatefulWidget {
  @override
  _ScrollBarPageState createState() => _ScrollBarPageState();
}

class _ScrollBarPageState extends State<ScrollBarPage> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrollbar Page'),
      ),
      body: Scrollbar(
        controller: _controller,
        thickness: 5,
        isAlwaysShown: true,
        radius: Radius.circular(2.5),
        child: ListView.builder(
          controller: _controller,
          itemCount: 50,
          itemBuilder: _itemBuilder,
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    if (0 == index) {
      return DDDCard(
        title: 'Scrollbar',
        subTitles: [
          '给滚动视图加一个滚动条',
          'isAlwaysShown是否总是显示',
          'thickness宽度',
          'radius圆角',
        ],
        child: Container(),
      );
    } else {
      return Container(
        width: double.infinity,
        height: 50,
        color: Colors.yellow[100 * ((index % 8 + 1))],
        child: Text('index-->$index'),
      );
    }
  }
}
