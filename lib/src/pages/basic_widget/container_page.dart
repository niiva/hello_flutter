import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';
import 'package:hello_flutter/src/component/ddd_popup.dart';
import 'package:hello_flutter/src/component/ddd_row_add_remove.dart';
import 'package:hello_flutter/src/component/ddd_slider.dart';

class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  // 第一页用的状态
  double _paddingTop;
  double _paddingLeft;
  double _paddingBottom;
  double _paddingRight;

  double _marginTop;
  double _marginLeft;
  double _marginBottom;
  double _marginRight;

  // 第二页用的状态
  Alignment _alignment;
  double _sliderValue;
  Alignment _transformAlienment;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );

    // 第一页用的状态
    _paddingTop = 50.0;
    _paddingLeft = 50.0;
    _paddingBottom = 50.0;
    _paddingRight = 50.0;

    _marginTop = 20.0;
    _marginLeft = 20.0;
    _marginBottom = 20.0;
    _marginRight = 20.0;

    // 第二页用的状态
    _alignment = Alignment.topLeft;
    _sliderValue = 0;
    _transformAlienment = Alignment.topLeft;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Container Page',
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.amber,
          tabs: [
            Tab(text: '内外边距'),
            Tab(text: 'transform'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _page1(),
          _page2(),
        ],
      ),
    );
  }

  Widget _page1() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            color: Colors.purple,
            child: Center(
              child: Container(
                margin: EdgeInsets.only(
                  top: _marginTop,
                  left: _marginLeft,
                  bottom: _marginBottom,
                  right: _marginRight,
                ),
                padding: EdgeInsets.only(
                  top: _paddingTop,
                  left: _paddingLeft,
                  bottom: _paddingBottom,
                  right: _paddingRight,
                ),
                color: Colors.green,
                child: Container(
                  color: Colors.yellow,
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
                  DDDDescText(
                    textList: ['padding字段指定内边距:'],
                  ),
                  DDDRowAddRemove(
                    title: 'Top',
                    defaultValue: _paddingTop,
                    stepValue: 10.0,
                    maxValue: 100.0,
                    minValue: 0.0,
                    valueChanged: (value) {
                      setState(() {
                        _paddingTop = value;
                      });
                    },
                  ),
                  DDDRowAddRemove(
                    title: 'Left',
                    defaultValue: _paddingLeft,
                    stepValue: 10.0,
                    maxValue: 100.0,
                    minValue: 0.0,
                    valueChanged: (value) {
                      setState(() {
                        _paddingLeft = value;
                      });
                    },
                  ),
                  DDDRowAddRemove(
                    title: 'Bottom',
                    defaultValue: _paddingBottom,
                    stepValue: 10.0,
                    maxValue: 100.0,
                    minValue: 0.0,
                    valueChanged: (value) {
                      setState(() {
                        _paddingBottom = value;
                      });
                    },
                  ),
                  DDDRowAddRemove(
                    title: 'Right',
                    defaultValue: _paddingRight,
                    stepValue: 10.0,
                    maxValue: 100.0,
                    minValue: 0.0,
                    valueChanged: (value) {
                      setState(() {
                        _paddingRight = value;
                      });
                    },
                  ),
                  DDDDescText(
                    textList: ['margin字段用于指定外边距:'],
                  ),
                  DDDRowAddRemove(
                    title: 'Top',
                    defaultValue: _marginTop,
                    stepValue: 10.0,
                    maxValue: 50.0,
                    minValue: 0.0,
                    valueChanged: (value) {
                      setState(() {
                        _marginTop = value;
                      });
                    },
                  ),
                  DDDRowAddRemove(
                    title: 'Left',
                    defaultValue: _marginLeft,
                    stepValue: 10.0,
                    maxValue: 50.0,
                    minValue: 0.0,
                    valueChanged: (value) {
                      setState(() {
                        _marginLeft = value;
                      });
                    },
                  ),
                  DDDRowAddRemove(
                    title: 'Bottom',
                    defaultValue: _marginBottom,
                    stepValue: 10.0,
                    maxValue: 50.0,
                    minValue: 0.0,
                    valueChanged: (value) {
                      setState(() {
                        _marginBottom = value;
                      });
                    },
                  ),
                  DDDRowAddRemove(
                    title: 'Right',
                    defaultValue: _marginRight,
                    stepValue: 10.0,
                    maxValue: 50.0,
                    minValue: 0.0,
                    valueChanged: (value) {
                      setState(() {
                        _marginRight = value;
                      });
                    },
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

  Widget _page2() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: Center(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.yellow,
                alignment: _alignment,
                transform: Matrix4.rotationZ(pi / 180 * _sliderValue),
                transformAlignment: _transformAlienment,
                child: Text(
                  'ABCD啊啊啊',
                  style: TextStyle(
                    fontSize: 20,
                  ),
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
                  DDDPopup(
                    title: '内容对齐方式',
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
                        _alignment = value;
                      });
                    },
                  ),
                  DDDSlider(
                    padding: EdgeInsets.all(20),
                    title: '顺时针旋转(角度)',
                    defaultValue: 0,
                    max: 360,
                    min: 0,
                    label: '${_sliderValue.round()}度',
                    valueChanged: (value) {
                      setState(() {
                        _sliderValue = value;
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
                        _transformAlienment = value;
                      });
                    },
                  ),
                  DDDDescText(
                    textList: [
                      '其他常用字段:',
                      'constraints对齐加约束:',
                      '    max width/height',
                      '    min width/height',
                    ],
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
