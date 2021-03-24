import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';
import 'package:hello_flutter/src/component/ddd_row_add_remove.dart';
import 'package:hello_flutter/src/component/ddd_row_radio.dart';
import 'package:toast/toast.dart';

class FractionalTranslationPage extends StatefulWidget {
  static List<Offset> generatePoints({
    @required Offset startPoint,
    @required Offset endPoint,
  }) {
    List<Offset> pList = [];

    double x = startPoint.dx;
    double y = startPoint.dy;

    while ((endPoint.dx - x).abs() > 5 || (endPoint.dy - y).abs() > 5) {
      double xLen = endPoint.dx - x;
      double yLen = endPoint.dy - y;
      if (xLen > 0) {
        x += 5;
      } else if (xLen < 0) {
        x -= 5;
      }

      if (yLen > 0) {
        y += 5;
      } else if (yLen < 0) {
        y -= 5;
      }

      pList.add(Offset(x, y));
    }

    return pList;
  }

  @override
  _FractionalTranslationPageState createState() =>
      _FractionalTranslationPageState();
}

class _FractionalTranslationPageState extends State<FractionalTranslationPage> {
  double _hOffset;
  double _vOffset;
  bool _transformHitTests2;

  @override
  void initState() {
    super.initState();

    _hOffset = 0.0;
    _vOffset = 0.0;
    _transformHitTests2 = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FractionalTranslateion Page'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: RepaintBoundary(
                child: CustomPaint(
                  painter: _MyPainter2(
                    context: context,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      FractionalTranslation(
                        translation: Offset(_hOffset, _vOffset),
                        transformHitTests: _transformHitTests2,
                        child: Opacity(
                          opacity: 0.6,
                          child: Container(
                            width: 100,
                            height: 100,
                            color: Colors.yellow,
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: Container(),
                              onTap: () {
                                Toast.show(
                                  "点击了黄色块",
                                  context,
                                  duration: Toast.LENGTH_SHORT,
                                  gravity: Toast.CENTER,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DDDRowAddRemove(
                      title: '横向移动',
                      defaultValue: 0.0,
                      stepValue: 0.5,
                      maxValue: 2.0,
                      minValue: -2.0,
                      valueChanged: (value) {
                        setState(() {
                          _hOffset = value;
                        });
                      },
                    ),
                    DDDRowAddRemove(
                      title: '纵向移动',
                      defaultValue: 0.0,
                      stepValue: 0.5,
                      maxValue: 2.5,
                      minValue: 0.0,
                      valueChanged: (value) {
                        setState(() {
                          _vOffset = value;
                        });
                      },
                    ),
                    DDDRowRadio(
                      title: '跟随转点击区域',
                      leftTitle: 'true',
                      rightTitle: 'false',
                      leftClicked: () {
                        setState(() {
                          _transformHitTests2 = true;
                        });
                      },
                      rightClicked: () {
                        setState(() {
                          _transformHitTests2 = false;
                        });
                      },
                    ),
                    DDDDescText(
                      textList: [
                        'transformHitTests:',
                        '    设置点击区域是否跟随移动',
                        '    true时点击黄色区域响应',
                        '    false时点击区域在原始区域(虚线框)'
                      ],
                    ),
                    DDDDescText(
                      textList: [
                        'FractionalTranslation移动组件',
                        '!!!!!!',
                        'Transform的变换是应用在「绘制阶段」',
                        '所以无论对子widget应用何种变化(layout)',
                        '其位置和大小都是固定不变的',
                        '不会影响其他widget的位置和大小',
                        '   与Transform.translate不同的是:',
                        '   translation的Offset代表的的是「倍数」',
                      ],
                    ),
                    Container(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MyPainter2 extends CustomPainter {
  Paint _myPaint;
  BuildContext context;

  _MyPainter2({
    @required this.context,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _myPaint = new Paint();
    _myPaint.color = Colors.black;
    _myPaint.strokeWidth = 1;

    double scWidth = MediaQuery.of(context).size.width;
    double startX = (scWidth - 100) / 2;
    double startY = 30;

    Offset p1 = Offset(startX, startY);
    Offset p2 = Offset(startX + 100, startY);
    Offset p3 = Offset(startX + 100, startY + 100);
    Offset p4 = Offset(startX, startY + 100);

    // 组装点信息
    List<Offset> l1 = FractionalTranslationPage.generatePoints(
      startPoint: p1,
      endPoint: p2,
    );
    List<Offset> l2 = FractionalTranslationPage.generatePoints(
      startPoint: p2,
      endPoint: p3,
    );
    List<Offset> l3 = FractionalTranslationPage.generatePoints(
      startPoint: p3,
      endPoint: p4,
    );
    List<Offset> l4 = FractionalTranslationPage.generatePoints(
      startPoint: p4,
      endPoint: p1,
    );
    List<Offset> list = [
      ...l1,
      ...l2,
      ...l3,
      ...l4,
    ];
    canvas.drawPoints(
      PointMode.points,
      list,
      _myPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
