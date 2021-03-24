import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class OverlayPage extends StatefulWidget {
  static bool entryShow = false;
  static OverlayEntry entry = OverlayEntry(
    builder: (BuildContext context) {
      return Positioned(
        left: 100,
        top: 400,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.black,
        ),
      );
    },
  );

  @override
  _OverlayPageState createState() => _OverlayPageState();
}

class _OverlayPageState extends State<OverlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overlay Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: 'Overlay',
            subTitles: [
              '全局的悬浮组件',
              '打开开关后会在屏幕中出现一个黑色的Container',
              '退出这个页面试试?',
              '要关闭这个东西, 只需回来关闭开关',
            ],
            child: Container(
              alignment: Alignment.center,
              child: Switch(
                value: OverlayPage.entryShow,
                onChanged: (value) {
                  if (true == value) {
                    Overlay.of(context).insert(OverlayPage.entry);
                  } else {
                    OverlayPage.entry.remove();
                  }

                  setState(() {
                    OverlayPage.entryShow = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
