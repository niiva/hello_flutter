import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';
import 'package:hello_flutter/src/component/ddd_slider.dart';

class OpacityPage extends StatefulWidget {
  @override
  _OpacityPageState createState() => _OpacityPageState();
}

class _OpacityPageState extends State<OpacityPage> {
  double _value;

  @override
  void initState() {
    super.initState();
    _value = 0.5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opacity Page'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Center(
                child: Opacity(
                  opacity: _value,
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.green,
                    child: Center(
                        child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          '啊',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  DDDSlider(
                    padding: EdgeInsets.all(
                      20,
                    ),
                    title: '设置透明度(opacity)',
                    defaultValue: _value,
                    label: '${_value.toStringAsFixed(2)}',
                    valueChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                  DDDDescText(
                    paddingTop: 20,
                    textList: [
                      'opacity属性会影响所有的子控件!!!',
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
