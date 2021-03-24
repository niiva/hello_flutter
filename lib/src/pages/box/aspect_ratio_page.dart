import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';
import 'package:hello_flutter/src/component/ddd_wh_slider.dart';

class AspectRatioPage extends StatefulWidget {
  @override
  _AspectRatioPageState createState() => _AspectRatioPageState();
}

class _AspectRatioPageState extends State<AspectRatioPage> {
  double _wValue;
  double _hValue;

  @override
  void initState() {
    super.initState();
    _wValue = 50.0;
    _hValue = 50.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AspectRatio Page'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Center(
                child: AspectRatio(
                  aspectRatio: _wValue / _hValue,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    DDDWHSlider(
                      hDefaultValue: _wValue,
                      hLabel: '${_wValue.toStringAsFixed(2)}',
                      hMax: 100.0,
                      hMin: 1.0,
                      hValueChanged: (value) {
                        setState(() {
                          _wValue = value;
                        });
                      },
                      vDefaultValue: _hValue,
                      vLabel: '${_hValue.toStringAsFixed(2)}',
                      vMax: 100.0,
                      vMin: 1.0,
                      vValueChanged: (value) {
                        setState(() {
                          _hValue = value;
                        });
                      },
                      text:
                          '宽高比:(${_wValue.toStringAsFixed(2)}/${_hValue.toStringAsFixed(2)})',
                    ),
                    DDDDescText(
                      textList: [
                        '一般用于适配',
                        '屏幕定宽来做列表',
                        'itemHeight = screenWidth * ratio',
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
