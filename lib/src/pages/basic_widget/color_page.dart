import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class ColorPage extends StatefulWidget {
  @override
  _ColorPageState createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: '系统颜色',
            subTitles: [
              'Colors.xxx',
            ],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.green,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.purple,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
          DDDCard(
            title: 'ARGB颜色',
            subTitles: [
              'Color(0xAARRGGBB)',
              'Alpha16进制公式:',
              '   255 * Alpha百分比->转16进制',
              '   如: 25%透明度就是:',
              '   255*25%≈64->0x40',
            ],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Color(0xFF112233),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Color(0xFF778866),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Color(0x2F83A4F2),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Color(0xAA44FFCC),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Color(0xFF22AAFF),
                ),
              ],
            ),
          ),
          DDDCard(
            title: 'RGBO',
            subTitles: [
              'Color.fromRGBO(xxx, xxx, xxx, x.x)',
            ],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Color.fromRGBO(234, 111, 222, 0.5),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Color.fromRGBO(234, 111, 222, 1.0),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Color.fromRGBO(234, 111, 222, 0.6),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Color.fromRGBO(234, 111, 222, 0.7),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Color.fromRGBO(234, 111, 222, 0.8),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
