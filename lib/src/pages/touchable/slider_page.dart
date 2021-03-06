import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _value;

  @override
  void initState() {
    super.initState();
    _value = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Center(
                child: Text(
                  '${_value.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 22,
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
                    Padding(
                      padding: EdgeInsets.only(
                        top: 50,
                      ),
                      child: SliderTheme(
                        data: SliderThemeData(
                          showValueIndicator: ShowValueIndicator.always,
                          valueIndicatorColor: Colors.green,
                        ),
                        child: Slider(
                          value: _value,
                          activeColor: Colors.green,
                          inactiveColor: Colors.grey,
                          label: '${_value.toStringAsFixed(2)}',
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                            });
                          },
                        ),
                      ),
                    ),
                    DDDDescText(
                      textList: [
                        '??????????????????label???????????????divisions>0????????????',
                        '    ????????????SliderTheme??????:',
                        '    ShowValueIndicator.always',
                        '    ??????????????????',
                        '??????????????????????????????SliderTheme??????:',
                        '    valueIndicatorColor',
                        '    ??????????????????',
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
