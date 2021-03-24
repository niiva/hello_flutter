import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';
import 'package:hello_flutter/src/component/ddd_row_add_remove.dart';

class PaddingPage extends StatefulWidget {
  @override
  _PaddingPageState createState() => _PaddingPageState();
}

class _PaddingPageState extends State<PaddingPage> {
  double _top;
  double _left;
  double _bottom;
  double _right;

  @override
  void initState() {
    super.initState();
    _top = 50.0;
    _left = 50.0;
    _bottom = 50.0;
    _right = 50.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Padding Page'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: _top,
                    left: _left,
                    bottom: _bottom,
                    right: _right,
                  ),
                  child: Container(
                    color: Colors.green,
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
                    DDDRowAddRemove(
                      title: 'Top',
                      defaultValue: _top,
                      stepValue: 10.0,
                      maxValue: 100.0,
                      minValue: 0.0,
                      valueChanged: (value) {
                        setState(() {
                          _top = value;
                        });
                      },
                    ),
                    DDDRowAddRemove(
                      title: 'Left',
                      defaultValue: _left,
                      stepValue: 10.0,
                      maxValue: 100.0,
                      minValue: 0.0,
                      valueChanged: (value) {
                        setState(() {
                          _left = value;
                        });
                      },
                    ),
                    DDDRowAddRemove(
                      title: 'Bottom',
                      defaultValue: _bottom,
                      stepValue: 10.0,
                      maxValue: 100.0,
                      minValue: 0.0,
                      valueChanged: (value) {
                        setState(() {
                          _bottom = value;
                        });
                      },
                    ),
                    DDDRowAddRemove(
                      title: 'Right',
                      defaultValue: _right,
                      stepValue: 10.0,
                      maxValue: 100.0,
                      minValue: 0.0,
                      valueChanged: (value) {
                        setState(() {
                          _right = value;
                        });
                      },
                    ),
                    DDDDescText(
                      textList: ['用于指定子组件与自己的内边距'],
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
