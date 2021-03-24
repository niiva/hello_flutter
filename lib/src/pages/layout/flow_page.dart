import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class FlowPage extends StatefulWidget {
  @override
  _FlowPageState createState() => _FlowPageState();
}

class _FlowPageState extends State<FlowPage> {
  List<Widget> _flowChildren;

  @override
  void initState() {
    super.initState();

    _flowChildren = [];
    for (var i = 0; i < 18; i++) {
      UnconstrainedBox box = UnconstrainedBox(
        child: Container(
          alignment: Alignment.center,
          width: 20.0,
          height: 20.0,
          color: Colors.blue,
          child: Text('${i + 1}'),
        ),
      );

      _flowChildren.add(box);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flow Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: '斜线布局',
            subTitles: [
              '1.把Flow放入Container容器中可能会导致context.getChildSize获取失败, '
                  '设置Flow外层的Container的alignment可以解决此问题!',
              '2.Flow中的标签结构为如果是Container可能会导致元素充满Flow, '
                  '在Container外面包一层UnconstrainedBox可以解决!',
            ],
            child: Center(
              child: Container(
                color: Colors.yellow,
                width: 300,
                height: 300,
                alignment: Alignment.center,
                child: Flow(
                  children: _flowChildren,
                  delegate: _SlashFlowDelegate(),
                ),
              ),
            ),
          ),
          DDDCard(
            title: '圆形布局',
            subTitles: [
              '1.把Flow放入Container容器中可能会导致context.getChildSize获取失败, '
                  '设置Flow外层的Container的alignment可以解决此问题!',
              '2.Flow中的标签结构为如果是Container可能会导致元素充满Flow, '
                  '在Container外面包一层UnconstrainedBox可以解决!',
              '另外, 角度<->弧度的公式:',
              '   弧度 = π / 180 * 角度',
              '   角度 = 弧度 * 180 / π'
            ],
            child: Center(
              child: Container(
                color: Colors.yellow,
                width: 300,
                height: 300,
                alignment: Alignment.center,
                child: Flow(
                  children: _flowChildren,
                  delegate: _CircleFlowDelegate(),
                ),
              ),
            ),
          ),
          DDDCard(
            title: '笛卡尔心形线布局',
            subTitles: [
              '1.把Flow放入Container容器中可能会导致context.getChildSize获取失败, '
                  '设置Flow外层的Container的alignment可以解决此问题!',
              '2.Flow中的标签结构为如果是Container可能会导致元素充满Flow, '
                  '在Container外面包一层UnconstrainedBox可以解决!',
              '笛卡尔心形公式:r=a(1-sinθ)',
              'Emmm...说实话看起来像是个苹果',
            ],
            child: Center(
              child: Container(
                color: Colors.yellow,
                width: 300,
                height: 300,
                alignment: Alignment.center,
                child: Flow(
                  children: _flowChildren,
                  delegate: _HeartFlowDelegate(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 斜线布局
class _SlashFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    // 这里容器和child都是正方形
    double fWidth = context.size.width;
    // 容器对角线长度
    double fSlashLength = sqrt(pow(fWidth, 2) * 2);
    // child宽度
    double cWidth = context.getChildSize(0).width;
    // child对角线长度
    double cSlashLength = sqrt(pow(cWidth, 2) * 2);

    int count = context.childCount;

    // 斜向间距
    double slashLength = fSlashLength - cSlashLength * count;
    double perSlashLength = slashLength / (count - 1);

    // xy轴偏移量
    double xyLength = sqrt(perSlashLength * perSlashLength / 2);
    xyLength = slashLength > 0 ? xyLength : -xyLength;

    for (var i = 0; i < count; i++) {
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          (xyLength + cWidth) * i,
          (xyLength + cWidth) * i,
          0,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return true;
  }
}

/// 圆形布局
class _CircleFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    double fWidth = context.size.shortestSide;
    double cWidth = context.getChildSize(0).width;

    double fRadius = fWidth / 2 - cWidth / 2;

    int count = context.childCount;
    // double perAngel = 360.0 / count;
    // 弧度 = π / 180 * 角度
    // double perRadians = pi / 180 * 360.0 / count
    double perRadians = pi * 2 / count;

    for (var i = 0; i < count; i++) {
      // a = sinaA * c
      // b = cosA * c
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          fRadius - cos(perRadians * i) * fRadius,
          fRadius - sin(perRadians * i) * fRadius,
          0,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return true;
  }
}

/// 心形布局
class _HeartFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    double fWidth = context.size.width;
    double cWidth = context.getChildSize(0).width;
    int count = context.childCount;
    // 中心点
    Offset center = Offset(fWidth / 2, fWidth / 2);
    // 这里把画布分成三等分 中间一个圆 + 上面一个圆
    // 上面的圆绕中心圆旋转 <起始重合点>的路径就是笛卡尔心形线
    // 两个圆的半径都是
    double cRadius = fWidth / 3 / 2;
    // 起始点
    Offset sPoint = Offset(center.dx, center.dy - cRadius);

    // double perAngel = 360.0 / count;
    // 弧度 = π / 180 * 角度
    // double perRadians = pi / 180 * 360.0 / count
    double perRadians = pi * 2 / count;

    for (var i = 0; i < count; i++) {
      double radians = perRadians * i;
      // 余弦定理cosA=(b²+c²-a²)/2bc
      // a = sqrt(b²+c²-cosA*2bc)
      // <起始重合点>到center的距离 外圆角度=2*中心圆角度
      double b = cRadius * 2 - 10; // 微调
      double c = cRadius - cWidth / 2 + 40; // 微调
      double rLength = sqrt(pow(b, 2) + pow(c, 2) - cos(radians) * 2 * b * c);
      // x轴偏移量
      double xOffset = sin(radians) * rLength;
      double yOffset = center.dy - cos(radians) * rLength;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          sPoint.dx - cWidth / 2 + xOffset,
          yOffset - cWidth / 2 - 40, // 微调
          0,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return true;
  }
}
