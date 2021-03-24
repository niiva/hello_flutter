import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';
import 'package:hello_flutter/src/component/ddd_slider.dart';

class BackdropFilterPage extends StatefulWidget {
  @override
  _BackdropFilterPageState createState() => _BackdropFilterPageState();
}

class _BackdropFilterPageState extends State<BackdropFilterPage> {
  double _blurValue;

  @override
  void initState() {
    super.initState();
    _blurValue = 5.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BackdropFilter Page'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.yellow,
                  child: Center(
                    child: Image.asset(
                      'assets/images/katong.jpg',
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Draggable(
                    hitTestBehavior: HitTestBehavior.opaque,
                    child: _dragableChild(),
                    childWhenDragging: Container(),
                    feedback: _dragableChild(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DDDSlider(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      title: '模糊程度',
                      min: 0.0,
                      max: 20.0,
                      defaultValue: _blurValue,
                      label: '${_blurValue.toStringAsFixed(2)}',
                      valueChanged: (value) {
                        setState(() {
                          _blurValue = value;
                        });
                      },
                    ),
                    DDDDescText(
                      textList: [
                        '使用BackdropFilter',
                        '和ImageFilter可以做出模糊效果',
                        '',
                        '组件上的文字外层需要加Material',
                        '否则会出现双下划线效果',
                      ],
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

  Widget _dragableChild() {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: _blurValue,
          sigmaY: _blurValue,
        ),
        child: Container(
          alignment: Alignment.center,
          width: 200.0,
          height: 200.0,
          child: Material(
            color: Color.fromRGBO(0, 0, 0, 0),
            child: Text(
              '拽我',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
