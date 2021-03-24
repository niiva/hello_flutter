import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';

class SingleChildScrollViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollView Page'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DDDDescText(
              textList: [
                'Tips:',
                '通常SingleChildScrollView只应在期望的内容不会超过屏幕太多时使用',
                '   这是因为SingleChildScrollView不支持基于Sliver的延迟实例化模式',
                '   所以如果预计视口可能包含超出屏幕尺寸太多的内容时',
                '   使用SingleChildScrollView将会导致性能差的问题',
                '   此时应该使用一些支持Sliver延迟加载的可滚动组件,如ListView',
                '',
                '',
                '由于不支持Sliver, 如果在SingleChildScrollView上需要调用Canvas',
                '   如CustomPaint, 外层需要用RepaintBoundary包裹',
                '   交由RepaintBoundary处理,避免反复重绘',
                '',
                '',
                '只能有一个child, 一般根据滚动方向放入Column/Row',
                '通过scrollDirection控制滚动方向',
              ],
            ),
          ],
        ),
      ),
    );
  }
}
