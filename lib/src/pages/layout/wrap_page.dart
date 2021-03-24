import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';
import 'package:hello_flutter/src/component/ddd_popup.dart';
import 'package:hello_flutter/src/component/ddd_row_add_remove.dart';
import 'package:hello_flutter/src/component/ddd_row_radio.dart';

class WrapPage extends StatefulWidget {
  @override
  _WrapPageState createState() => _WrapPageState();
}

class _WrapPageState extends State<WrapPage> {
  String _axis;
  int _count;
  double _spacing;
  double _runSpacing;
  WrapAlignment _alignment;
  WrapAlignment _runAlignment;

  @override
  void initState() {
    super.initState();
    _axis = 'h';
    _count = 7;
    _spacing = 40.0;
    _runSpacing = 40.0;
    _alignment = WrapAlignment.start;
    _runAlignment = WrapAlignment.start;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap Page'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: SingleChildScrollView(
                scrollDirection: 'h' == _axis ? Axis.vertical : Axis.horizontal,
                child: Wrap(
                  direction: 'h' == _axis ? Axis.horizontal : Axis.vertical,
                  spacing: _spacing,
                  runSpacing: _runSpacing,
                  alignment: _alignment,
                  runAlignment: _runAlignment,
                  children:
                      this._wrapChildren(MediaQuery.of(context).size.width),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DDDRowRadio(
                      title: '布局方向',
                      leftTitle: '横向',
                      rightTitle: '竖向',
                      leftClicked: () {
                        setState(() {
                          _axis = 'h';
                        });
                      },
                      rightClicked: () {
                        setState(() {
                          _axis = 'v';
                        });
                      },
                    ),
                    DDDRowAddRemove(
                      title: '模块数',
                      defaultValue: 7,
                      stepValue: 1,
                      maxValue: 100,
                      minValue: 0,
                      valueChanged: (value) {
                        setState(() {
                          _count = value.round();
                        });
                      },
                    ),
                    DDDRowAddRemove(
                      title: '主轴间距',
                      defaultValue: 40.0,
                      stepValue: 10.0,
                      maxValue: 100.0,
                      minValue: -50.0,
                      valueChanged: (value) {
                        setState(() {
                          _spacing = value;
                        });
                      },
                    ),
                    DDDRowAddRemove(
                      title: '交叉轴间距',
                      defaultValue: 40.0,
                      stepValue: 10.0,
                      maxValue: 100.0,
                      minValue: -50.0,
                      valueChanged: (value) {
                        setState(() {
                          _runSpacing = value;
                        });
                      },
                    ),
                    DDDPopup(
                      title: '主轴',
                      menuList: [
                        WrapAlignment.start,
                        WrapAlignment.center,
                        WrapAlignment.end,
                        WrapAlignment.spaceAround,
                        WrapAlignment.spaceBetween,
                        WrapAlignment.spaceEvenly,
                      ],
                      valueChanged: (value) {
                        setState(() {
                          _alignment = value;
                        });
                      },
                    ),
                    DDDPopup(
                      title: '交叉轴',
                      menuList: [
                        WrapAlignment.start,
                        WrapAlignment.center,
                        WrapAlignment.end,
                        WrapAlignment.spaceAround,
                        WrapAlignment.spaceBetween,
                        WrapAlignment.spaceEvenly,
                      ],
                      valueChanged: (value) {
                        setState(() {
                          _runAlignment = value;
                        });
                      },
                    ),
                    DDDDescText(
                      textList: [
                        '这里的容器是ScrollView',
                        '长度不确定',
                        '所以交叉轴对齐方式无效',
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

  List<Widget> _wrapChildren(double width) {
    List<Widget> wList = [];
    for (int i = 0; i < _count; i++) {
      Container c = Container(
        width: width / 5,
        height: width / 5,
        child: Center(
          child: Text(
            '${i + 1}',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      );
      wList.add(c);
    }
    return wList;
  }
}
