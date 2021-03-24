import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';

class BottomNavigationBarPage extends StatefulWidget {
  @override
  _BottomNavigationBarPageState createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BottomNavigationBar Page',
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 30.0,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.green,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: Center(
        child: DDDDescText(
          textList: [
            'Scaffold的bottomNavigationBar中设置',
            'currentIndex当前选中(0开始)',
            'iconSize图标大小',
            'fixedColor设置选中颜色',
            'type:',
            '   fixed灰色/选中颜色',
            '   shifting透明/选中颜色',
            'items里放入BottomNavigationBarItem',
            'onTap处理点击事件, 返回选中index',
          ],
        ),
      ),
    );
  }
}
