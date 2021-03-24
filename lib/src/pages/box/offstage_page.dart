import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';
import 'package:hello_flutter/src/component/ddd_row_radio.dart';

class OffstagePage extends StatefulWidget {
  @override
  _OffstagePageState createState() => _OffstagePageState();
}

class _OffstagePageState extends State<OffstagePage> {
  bool _hideRed;
  bool _hideBlue;
  bool _hideGreen;

  @override
  void initState() {
    super.initState();
    _hideRed = false;
    _hideBlue = false;
    _hideGreen = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offstage Page'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  Offstage(
                    offstage: _hideRed,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                    ),
                  ),
                  Offstage(
                    offstage: _hideBlue,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                    ),
                  ),
                  Offstage(
                    offstage: _hideGreen,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DDDRowRadio(
                    title: '红色offstage',
                    leftTitle: 'false',
                    rightTitle: 'true',
                    leftClicked: () {
                      setState(() {
                        _hideRed = false;
                      });
                    },
                    rightClicked: () {
                      setState(() {
                        _hideRed = true;
                      });
                    },
                  ),
                  DDDRowRadio(
                    title: '蓝色offstage',
                    leftTitle: 'false',
                    rightTitle: 'true',
                    leftClicked: () {
                      setState(() {
                        _hideBlue = false;
                      });
                    },
                    rightClicked: () {
                      setState(() {
                        _hideBlue = true;
                      });
                    },
                  ),
                  DDDRowRadio(
                    title: '绿色offstage',
                    leftTitle: 'false',
                    rightTitle: 'true',
                    leftClicked: () {
                      setState(() {
                        _hideGreen = false;
                      });
                    },
                    rightClicked: () {
                      setState(() {
                        _hideGreen = true;
                      });
                    },
                  ),
                  DDDDescText(
                    textList: [
                      'offstate代表是否隐藏该组件',
                      '组件初始化时默认为true',
                      'offstage不会停止组件动画',
                      '如果组件有动画, 需要手动停止',
                    ],
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
