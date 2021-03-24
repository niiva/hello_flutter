import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';
import 'package:hello_flutter/src/component/ddd_popup.dart';
import 'package:hello_flutter/src/component/ddd_row_radio.dart';

class FittedBoxPage extends StatefulWidget {
  @override
  _FittedBoxPageState createState() => _FittedBoxPageState();
}

class _FittedBoxPageState extends State<FittedBoxPage> {
  BoxFit _bf;
  Alignment _al;
  bool _isText;

  @override
  void initState() {
    super.initState();
    _bf = BoxFit.contain;
    _al = Alignment.topLeft;
    _isText = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FittedBox Page'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                width: 300,
                height: 300,
                color: Colors.yellow,
                child: FittedBox(
                  fit: _bf,
                  alignment: _al,
                  child: Container(
                    child: _isText
                        ? Text('abcdefg')
                        : Image.asset('assets/images/katong.jpg'),
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
                  DDDRowRadio(
                    title: 'Widget',
                    leftTitle: '文字',
                    rightTitle: '图片',
                    leftClicked: () {
                      setState(() {
                        _isText = true;
                      });
                    },
                    rightClicked: () {
                      setState(() {
                        _isText = false;
                      });
                    },
                  ),
                  DDDPopup(
                    title: 'BoxFit',
                    menuList: [
                      BoxFit.contain,
                      BoxFit.cover,
                      BoxFit.fill,
                      BoxFit.fitHeight,
                      BoxFit.fitWidth,
                      BoxFit.none,
                      BoxFit.scaleDown,
                    ],
                    valueChanged: (value) {
                      setState(() {
                        _bf = value;
                      });
                    },
                  ),
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
                  DDDDescText(
                    textList: [
                      'BoxFit的理解与Image里的BoxFit一样',
                      '只不过FittedBox的内容可能溢出父组件',
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
