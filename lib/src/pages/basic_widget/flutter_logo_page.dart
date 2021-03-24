import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';
import 'package:hello_flutter/src/component/ddd_popup.dart';

class FlutterLogoPage extends StatefulWidget {
  @override
  _FlutterLogoPageState createState() => _FlutterLogoPageState();
}

class _FlutterLogoPageState extends State<FlutterLogoPage> {
  FlutterLogoStyle _style;

  @override
  void initState() {
    super.initState();
    _style = FlutterLogoStyle.horizontal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterLogo Page'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                child: FlutterLogo(
                  style: _style,
                  duration: Duration(seconds: 2),
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
                    title: 'style',
                    menuList: [
                      FlutterLogoStyle.horizontal,
                      FlutterLogoStyle.markOnly,
                      FlutterLogoStyle.stacked,
                    ],
                    valueChanged: (value) {
                      setState(() {
                        _style = value;
                      });
                    },
                  ),
                  DDDDescText(
                    textList: [
                      'Emmm...',
                      '字面意思理解就是Flutter的logo',
                      '并不知道有什么用',
                      '还带动画效果的',
                    ],
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
