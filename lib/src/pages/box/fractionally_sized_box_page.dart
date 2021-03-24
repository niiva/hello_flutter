import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';
import 'package:hello_flutter/src/component/ddd_popup.dart';
import 'package:hello_flutter/src/component/ddd_wh_slider.dart';

class FractionallySizedBoxPage extends StatefulWidget {
  @override
  _FractionallySizedBoxPageState createState() =>
      _FractionallySizedBoxPageState();
}

class _FractionallySizedBoxPageState extends State<FractionallySizedBoxPage> {
  double _widthFactor;
  double _heightFactor;
  Alignment _al;

  @override
  void initState() {
    super.initState();
    _widthFactor = 10.0;
    _heightFactor = 10.0;
    _al = Alignment.topLeft;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FractionallySizedBox Page'),
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
                child: FractionallySizedBox(
                  alignment: _al,
                  widthFactor: _widthFactor / 100.0,
                  heightFactor: _heightFactor / 100.0,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DDDDescText(
                    paddingTop: 20,
                    textList: ['百分比SizedBox'],
                  ),
                  DDDPopup(
                    paddingTop: 0,
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
                  SizedBox(
                    height: 20,
                  ),
                  DDDWHSlider(
                    hDefaultValue: _widthFactor,
                    hLabel: '${_widthFactor.toStringAsFixed(0)}%',
                    hMax: 100.0,
                    hMin: 1.0,
                    hValueChanged: (value) {
                      setState(() {
                        _widthFactor = value;
                      });
                    },
                    vDefaultValue: _heightFactor,
                    vLabel: '${_heightFactor.toStringAsFixed(0)}%',
                    vMax: 100.0,
                    vMin: 1.0,
                    vValueChanged: (value) {
                      setState(() {
                        _heightFactor = value;
                      });
                    },
                    text: '宽度百分比:${_widthFactor.toStringAsFixed(0)}%\n'
                        '高度百分比:${_heightFactor.toStringAsFixed(0)}%',
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
