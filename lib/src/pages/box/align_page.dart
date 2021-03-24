import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';
import 'package:hello_flutter/src/component/ddd_popup.dart';
import 'package:hello_flutter/src/component/ddd_row_add_remove.dart';
import 'package:hello_flutter/src/component/ddd_row_radio.dart';

class AlignPage extends StatefulWidget {
  @override
  _AlignPageState createState() => _AlignPageState();
}

class _AlignPageState extends State<AlignPage> {
  double _heightFactor;
  double _widthFactor;
  bool _setFactor;
  Alignment _al;

  @override
  void initState() {
    super.initState();
    _heightFactor = 2.0;
    _widthFactor = 2.0;
    _setFactor = true;
    _al = Alignment.topLeft;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Align Page'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.green,
              child: Center(
                child: Container(
                  color: Colors.yellow,
                  child: Align(
                    alignment: _al,
                    widthFactor: _setFactor ? _widthFactor : null,
                    heightFactor: _setFactor ? _heightFactor : null,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DDDPopup(
                    title: 'Alignment',
                    menuList: [
                      Alignment.topLeft,
                      Alignment.topCenter,
                      Alignment.topRight,
                      Alignment.centerLeft,
                      Alignment.center,
                      Alignment.centerRight,
                      Alignment.bottomLeft,
                      Alignment.bottomCenter,
                      Alignment.bottomRight,
                    ],
                    valueChanged: (value) {
                      setState(() {
                        _al = value;
                      });
                    },
                  ),
                  DDDRowRadio(
                    title: 'Factor',
                    leftTitle: '设置',
                    rightTitle: '不设置',
                    leftClicked: () {
                      setState(() {
                        _setFactor = true;
                      });
                    },
                    rightClicked: () {
                      setState(() {
                        _setFactor = false;
                      });
                    },
                  ),
                  Offstage(
                    offstage: !_setFactor,
                    child: Column(
                      children: [
                        DDDRowAddRemove(
                          title: 'widthFactor',
                          defaultValue: 2.0,
                          stepValue: 0.5,
                          maxValue: 5.0,
                          minValue: 1.0,
                          valueChanged: (value) {
                            setState(() {
                              _widthFactor = value;
                            });
                          },
                        ),
                        DDDRowAddRemove(
                          title: 'heightFactor',
                          defaultValue: 2.0,
                          stepValue: 0.5,
                          maxValue: 5.0,
                          minValue: 1.0,
                          valueChanged: (value) {
                            setState(() {
                              _heightFactor = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Offstage(
                    offstage: !_setFactor,
                    child: DDDDescText(
                      textList: [
                        'widthFactor、heightFactor不为空',
                        '组件的宽度 = widthFactor * 子控件的宽度',
                        '组件的高度 = heightFactor * 子控件的高度'
                      ],
                    ),
                  ),
                  Offstage(
                    offstage: _setFactor,
                    child: DDDDescText(
                      textList: [
                        'widthFactor、heightFactor都为空',
                        '组件会尽可能大(填满父组件)',
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
