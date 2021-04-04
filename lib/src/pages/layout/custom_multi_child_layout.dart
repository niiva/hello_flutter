import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class CustomMultiChildLayoutPage extends StatefulWidget {
  @override
  _CustomMultiChildLayoutPageState createState() =>
      _CustomMultiChildLayoutPageState();
}

class _CustomMultiChildLayoutPageState
    extends State<CustomMultiChildLayoutPage> {
  List<Widget> _cornerChildren;
  List<Widget> _circleChildren;

  @override
  void initState() {
    super.initState();
    _cornerChildren = [
      LayoutId(
        id: CornerType.topLeft,
        child: Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
      ),
      LayoutId(
        id: CornerType.topRight,
        child: Container(
          width: 50,
          height: 50,
          color: Colors.green,
        ),
      ),
      LayoutId(
        id: CornerType.bottomLeft,
        child: Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
      ),
      LayoutId(
        id: CornerType.bottomRight,
        child: Container(
          width: 50,
          height: 50,
          color: Colors.blue,
        ),
      ),
    ];

    _circleChildren = [];
    for (var i = 0; i < 20; i++) {
      LayoutId lI = LayoutId(
        id: i,
        child: Container(
          alignment: Alignment.center,
          width: 20,
          height: 20,
          color: Colors.blue,
          child: Text('${i + 1}'),
        ),
      );
      _circleChildren.add(lI);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomMultiChildLayout Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: '四角布局',
            subTitles: [
              'CustomMultiChildLayout:',
              '   delegate类型MultiChildLayoutDelegate',
              '   layoutChild布局child(返回size)',
              '   positionChild定位child',
            ],
            child: Container(
              width: double.infinity,
              height: 300,
              color: Colors.yellow,
              child: CustomMultiChildLayout(
                delegate: _FourCornerLayout(),
                children: _cornerChildren,
              ),
            ),
          ),
          DDDCard(
            title: '圆形布局',
            subTitles: [
              'CustomMultiChildLayout:',
              '   delegate类型MultiChildLayoutDelegate',
              '   layoutChild布局child(返回size)',
              '   positionChild定位child',
            ],
            child: Container(
              width: double.infinity,
              height: 300,
              color: Colors.yellow,
              child: CustomMultiChildLayout(
                delegate: _CircleLayout(count: _circleChildren.length),
                children: _circleChildren,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum CornerType {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

// 四角布局
class _FourCornerLayout extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    if (hasChild(CornerType.topLeft)) {
      layoutChild(
        CornerType.topLeft,
        BoxConstraints(),
      );
      positionChild(
        CornerType.topLeft,
        Offset(0, 0),
      );
    }

    if (hasChild(CornerType.topRight)) {
      Size childSize = layoutChild(
        CornerType.topRight,
        BoxConstraints(),
      );
      positionChild(
        CornerType.topRight,
        Offset(
          size.width - childSize.width,
          0,
        ),
      );
    }

    if (hasChild(CornerType.bottomLeft)) {
      Size childSize = layoutChild(
        CornerType.bottomLeft,
        BoxConstraints(),
      );
      positionChild(
        CornerType.bottomLeft,
        Offset(
          0,
          size.height - childSize.height,
        ),
      );
    }

    if (hasChild(CornerType.bottomRight)) {
      Size childSize = layoutChild(
        CornerType.bottomRight,
        BoxConstraints(),
      );
      positionChild(
        CornerType.bottomRight,
        Offset(
          size.width - childSize.width,
          size.height - childSize.height,
        ),
      );
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return false;
  }
}

// 中心圆布局
class _CircleLayout extends MultiChildLayoutDelegate {
  int count;

  _CircleLayout({@required this.count});

  @override
  void performLayout(Size size) {
    double fWidth = size.shortestSide;
    // x轴中心偏移量
    double xOffset = size.width > size.height
        ? (size.longestSide - size.shortestSide) / 2
        : 0.0;
    // y轴中心偏移量
    double yOffset = size.height > size.width
        ? (size.longestSide - size.shortestSide) / 2
        : 0.0;

    for (var i = 0; i < count; i++) {
      if (hasChild(i)) {
        double cWidth = layoutChild(i, BoxConstraints()).width;
        double fRadius = fWidth / 2 - cWidth / 2;
        // double perAngel = 360.0 / count;
        // 弧度 = π / 180 * 角度
        // double perRadians = pi / 180 * 360.0 / count
        double perRadians = pi * 2 / count;

        // a = sinaA * c
        // b = cosA * c
        positionChild(
          i,
          Offset(
            fRadius - cos(perRadians * i) * fRadius + xOffset,
            fRadius - sin(perRadians * i) * fRadius + yOffset,
          ),
        );
      }
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return false;
  }
}
