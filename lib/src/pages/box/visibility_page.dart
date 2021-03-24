import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';
import 'package:hello_flutter/src/component/ddd_row_radio.dart';
import 'package:toast/toast.dart';

class VisibilityPage extends StatefulWidget {
  @override
  _VisibilityPageState createState() => _VisibilityPageState();
}

class _VisibilityPageState extends State<VisibilityPage> {
  bool _showBlue;
  bool _keepSpace;
  bool _canTouch;
  bool _relace;

  @override
  void initState() {
    super.initState();
    _showBlue = true;
    _keepSpace = true;
    _canTouch = true;
    _relace = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visibility Page'),
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
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                  ),
                  Visibility(
                    visible: _showBlue,
                    replacement:
                        _relace ? Text('替换组件') : const SizedBox.shrink(),
                    maintainState: _keepSpace,
                    maintainAnimation: _keepSpace,
                    maintainSize: _keepSpace,
                    maintainInteractivity: _canTouch,
                    child: GestureDetector(
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            '点我',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Toast.show(
                          "点击了蓝色",
                          context,
                          duration: Toast.LENGTH_SHORT,
                          gravity: Toast.CENTER,
                        );
                      },
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
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
                    title: '蓝色visible',
                    leftTitle: 'true',
                    rightTitle: 'false',
                    leftClicked: () {
                      setState(() {
                        _showBlue = true;
                      });
                    },
                    rightClicked: () {
                      setState(() {
                        _showBlue = false;
                      });
                    },
                  ),
                  Offstage(
                    offstage: _keepSpace,
                    child: DDDRowRadio(
                      title: '隐藏时替换',
                      leftTitle: 'true',
                      rightTitle: 'false',
                      value: false,
                      leftClicked: () {
                        setState(() {
                          _relace = true;
                        });
                      },
                      rightClicked: () {
                        setState(() {
                          _relace = false;
                        });
                      },
                    ),
                  ),
                  DDDRowRadio(
                    title: '隐藏时是否保留空间',
                    leftTitle: 'true',
                    rightTitle: 'false',
                    value: _canTouch ? true : null,
                    leftClicked: () {
                      setState(() {
                        _keepSpace = true;
                      });
                    },
                    rightClicked: () {
                      setState(() {
                        _keepSpace = false;
                        _canTouch = false;
                      });
                    },
                  ),
                  DDDRowRadio(
                    title: '隐藏时是否可以点击',
                    leftTitle: 'true',
                    rightTitle: 'false',
                    value: !_keepSpace ? false : null,
                    leftClicked: () {
                      setState(() {
                        _canTouch = true;
                        _keepSpace = true;
                      });
                    },
                    rightClicked: () {
                      setState(() {
                        _canTouch = false;
                      });
                    },
                  ),
                  DDDDescText(
                    textList: [
                      'replacement字段只有在',
                      'mantainState为false时',
                      '才生效'
                    ],
                  ),
                  DDDDescText(
                    textList: [
                      '1.maintainState:(默认false)',
                      '隐藏后是否维持组件状态',
                      '2.maintainAnimation:(默认false)',
                      '隐藏后是否维组件中的动画',
                      '3.maintainSize:(默认false)',
                      '隐藏后是否保留所占空间',
                      '4.maintainInteractivity:(默认false)',
                      '隐藏后是否能够照常响应事件',
                      '字段的依赖关系:',
                      '(1)后面的为true, 前面的必须是true',
                      '如:3为true,那么1，2必须为true',
                      '(2)前面的是false, 后面的必须是false',
                      '如:2是false,那么3,4必须是false',
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
