import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';
import 'package:hello_flutter/src/component/ddd_popup.dart';
import 'package:hello_flutter/src/component/ddd_row_add_remove.dart';
import 'package:hello_flutter/src/component/ddd_row_radio.dart';
import 'package:hello_flutter/src/component/ddd_slider.dart';
import 'package:toast/toast.dart';

class TransformPage extends StatefulWidget {
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
  _TransformPageState createState() => _TransformPageState();
}

class _TransformPageState extends State<TransformPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  // 第一页所用state
  double _sliderValue1;
  Alignment _transformAlienment1;
  bool _transformHitTests1;

  // 第二页所用state
  double _hOffset;
  double _vOffset;
  bool _transformHitTests2;

  // 第三页所用state
  double _sliderValue3;
  Alignment _transformAlienment3;
  bool _transformHitTests3;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );

    // 第一页所用state
    _sliderValue1 = 0;
    _transformAlienment1 = Alignment.topLeft;
    _transformHitTests1 = true;

    // 第二页所用state
    _hOffset = 0.0;
    _vOffset = 0.0;
    _transformHitTests2 = true;

    // 第三页所用state
    _sliderValue3 = 1;
    _transformAlienment3 = Alignment.topLeft;
    _transformHitTests3 = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transform Page'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'rotate'),
            Tab(text: 'translate'),
            Tab(text: 'scale'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _page1(context),
          _page2(context),
          _page3(context),
        ],
      ),
    );
  }

  Widget _page1(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: RepaintBoundary(
              child: CustomPaint(
                painter: _MyPainter1(
                  context: context,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Transform.rotate(
                      angle: pi / 180 * _sliderValue1,
                      alignment: _transformAlienment1,
                      transformHitTests: _transformHitTests1,
                      child: Opacity(
                        opacity: 0.6,
                        child: Container(
                          width: 200,
                          height: 50,
                          color: Colors.yellow,
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
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
                  DDDSlider(
                    padding: EdgeInsets.all(20),
                    title: '顺时针旋转(角度)',
                    defaultValue: 0,
                    max: 360,
                    min: 0,
                    label: '${_sliderValue1.round()}度',
                    valueChanged: (value) {
                      setState(() {
                        _sliderValue1 = value;
                      });
                    },
                  ),
                  DDDPopup(
                    paddingTop: 0,
                    title: '旋转对齐方式:',
                    menuList: [
                      Alignment.topLeft,
                      Alignment.topCenter,
                      Alignment.topRight,
                      Alignment.centerLeft,
                      Alignment.center,
                      Alignment.centerRight,
                      Alignment.bottomLeft,
                      Alignment.bottomCenter,
                      Alignment.bottomRight
                    ],
                    valueChanged: (value) {
                      setState(() {
                        _transformAlienment1 = value;
                      });
                    },
                  ),
                  DDDRowRadio(
                    title: '是否旋转点击区域',
                    leftTitle: 'true',
                    rightTitle: 'false',
                    leftClicked: () {
                      setState(() {
                        _transformHitTests1 = true;
                      });
                    },
                    rightClicked: () {
                      setState(() {
                        _transformHitTests1 = false;
                      });
                    },
                  ),
                  DDDDescText(
                    textList: [
                      'transformHitTests:',
                      '    设置点击区域是否跟随旋转',
                      '    true时点击黄色区域响应',
                      '    false时点击区域在原始区域(虚线框)'
                    ],
                  ),
                  DDDDescText(
                    textList: [
                      'Transform.rotate和RotatedBox功能相似',
                      '!!!但是!!!',
                      'Transform的变换是应用在「绘制阶段」',
                      '所以无论对子widget应用何种变化(layout)',
                      '其位置和大小都是固定不变的',
                      '不会影响其他widget的位置和大小'
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
    );
  }

  Widget _page2(BuildContext context) {
    return Column(
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
                    Transform.translate(
                      offset: Offset(_hOffset, _vOffset),
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
                    stepValue: 20.0,
                    maxValue: 140.0,
                    minValue: -140.0,
                    valueChanged: (value) {
                      setState(() {
                        _hOffset = value;
                      });
                    },
                  ),
                  DDDRowAddRemove(
                    title: '纵向移动',
                    defaultValue: 0.0,
                    stepValue: 20.0,
                    maxValue: 140.0,
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
                      'Transform.translate移动组件',
                      '!!!!!!',
                      'Transform的变换是应用在「绘制阶段」',
                      '所以无论对子widget应用何种变化(layout)',
                      '其位置和大小都是固定不变的',
                      '不会影响其他widget的位置和大小'
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
    );
  }

  Widget _page3(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: RepaintBoundary(
              child: CustomPaint(
                painter: _MyPainter3(
                  context: context,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Transform.scale(
                      scale: _sliderValue3,
                      transformHitTests: _transformHitTests3,
                      alignment: _transformAlienment3,
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
                  DDDSlider(
                    padding: EdgeInsets.all(20),
                    title: '缩放倍数',
                    defaultValue: _sliderValue3,
                    max: 2,
                    min: 0.2,
                    label: '${_sliderValue3.toStringAsFixed(2)}',
                    valueChanged: (value) {
                      setState(() {
                        _sliderValue3 = value;
                      });
                    },
                  ),
                  DDDPopup(
                    paddingTop: 0,
                    title: '缩放对齐方式:',
                    menuList: [
                      Alignment.topLeft,
                      Alignment.topCenter,
                      Alignment.topRight,
                      Alignment.centerLeft,
                      Alignment.center,
                      Alignment.centerRight,
                      Alignment.bottomLeft,
                      Alignment.bottomCenter,
                      Alignment.bottomRight
                    ],
                    valueChanged: (value) {
                      setState(() {
                        _transformAlienment3 = value;
                      });
                    },
                  ),
                  DDDRowRadio(
                    title: '缩放点击区域',
                    leftTitle: 'true',
                    rightTitle: 'false',
                    leftClicked: () {
                      setState(() {
                        _transformHitTests3 = true;
                      });
                    },
                    rightClicked: () {
                      setState(() {
                        _transformHitTests3 = false;
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
                      'Transform.scale缩放组件',
                      '!!!!!!',
                      'Transform的变换是应用在「绘制阶段」',
                      '所以无论对子widget应用何种变化(layout)',
                      '其位置和大小都是固定不变的',
                      '不会影响其他widget的位置和大小'
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
    );
  }
}

class _MyPainter1 extends CustomPainter {
  Paint _myPaint;
  BuildContext context;

  _MyPainter1({
    @required this.context,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _myPaint = new Paint();
    _myPaint.color = Colors.black;
    _myPaint.strokeWidth = 1;

    double scWidth = MediaQuery.of(context).size.width;
    double startX = (scWidth - 200) / 2;
    double startY = 30;

    Offset p1 = Offset(startX, startY);
    Offset p2 = Offset(startX + 200, startY);
    Offset p3 = Offset(startX + 200, startY + 50);
    Offset p4 = Offset(startX, startY + 50);

    // 组装点信息
    List<Offset> l1 = TransformPage.generatePoints(
      startPoint: p1,
      endPoint: p2,
    );
    List<Offset> l2 = TransformPage.generatePoints(
      startPoint: p2,
      endPoint: p3,
    );
    List<Offset> l3 = TransformPage.generatePoints(
      startPoint: p3,
      endPoint: p4,
    );
    List<Offset> l4 = TransformPage.generatePoints(
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
    List<Offset> l1 = TransformPage.generatePoints(
      startPoint: p1,
      endPoint: p2,
    );
    List<Offset> l2 = TransformPage.generatePoints(
      startPoint: p2,
      endPoint: p3,
    );
    List<Offset> l3 = TransformPage.generatePoints(
      startPoint: p3,
      endPoint: p4,
    );
    List<Offset> l4 = TransformPage.generatePoints(
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

class _MyPainter3 extends CustomPainter {
  Paint _myPaint;
  BuildContext context;

  _MyPainter3({
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
    List<Offset> l1 = TransformPage.generatePoints(
      startPoint: p1,
      endPoint: p2,
    );
    List<Offset> l2 = TransformPage.generatePoints(
      startPoint: p2,
      endPoint: p3,
    );
    List<Offset> l3 = TransformPage.generatePoints(
      startPoint: p3,
      endPoint: p4,
    );
    List<Offset> l4 = TransformPage.generatePoints(
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
    return false;
  }
}
