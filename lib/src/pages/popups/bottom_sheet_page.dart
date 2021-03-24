import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';

class BottomSheetPage extends StatefulWidget {
  @override
  _BottomSheetPageState createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomSheet Page'),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
        color: Colors.green,
        child: Center(
          child: Text('bottomNavigationBar'),
        ),
      ),
      body: Center(
        child: CupertinoButton(
          color: Colors.green,
          child: Text('Click Me'),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MaterialButton(
                          child: Text(
                            '关闭',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    DDDDescText(
                      textList: [
                        '使用showModalBottomSheet构建',
                        'builder中可以放任意组件',
                        '自定义关闭用Navigator.pop(context)',
                        '点击蒙版区域/向下拖动白色区域都可实现关闭',
                        '会覆盖底部BottomNavigationBar',
                      ],
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
