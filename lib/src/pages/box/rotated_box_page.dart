import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';
import 'package:hello_flutter/src/component/ddd_row_add_remove.dart';

class RotatedBoxPage extends StatefulWidget {
  @override
  _RotatedBoxPageState createState() => _RotatedBoxPageState();
}

class _RotatedBoxPageState extends State<RotatedBoxPage> {
  int _quarterTurns;

  @override
  void initState() {
    super.initState();
    _quarterTurns = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RotatedBox Page'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RotatedBox(
                    quarterTurns: _quarterTurns,
                    child: Container(
                      width: 200,
                      height: 50,
                      color: Colors.yellow,
                      alignment: Alignment.center,
                      child: Text(
                        '啊啊啊啊啊啊啊啊啊',
                      ),
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
            child: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DDDRowAddRemove(
                      title: 'quarterTurns',
                      defaultValue: _quarterTurns,
                      stepValue: 1,
                      maxValue: 4,
                      minValue: 0,
                      valueChanged: (value) {
                        setState(() {
                          _quarterTurns = value;
                        });
                      },
                    ),
                    DDDDescText(
                      textList: [
                        'quarterTurns说明:',
                        '  int类型',
                        '  代表顺时针旋转多少个90度',
                      ],
                    ),
                    DDDDescText(
                      textList: [
                        'RotatedBox和Transform.rotate功能相似',
                        '它们都可以对子widget进行旋转变换',
                        '!!!但是!!!',
                        'RotatedBox的变换是在「layout阶段」',
                        '会影响其他widget的位置和大小',
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
}
