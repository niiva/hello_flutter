import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';

class AlertDialogPage extends StatefulWidget {
  @override
  _AlertDialogPageState createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialog Page'),
      ),
      body: Center(
        child: CupertinoButton(
          color: Colors.green,
          child: Text('Click Me'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Title'),
                  content: DDDDescText(
                    paddingTop: 0,
                    textList: [
                      '打开用showDialog()',
                      '关闭用Navigator.pop(context)',
                      'shape设置圆角/其他形状',
                      'content可以传任意组件',
                    ],
                  ),
                  actions: [
                    MaterialButton(
                      child: Text('Button1'),
                      onPressed: () {},
                    ),
                    MaterialButton(
                      child: Text('Button2'),
                      onPressed: () {},
                    ),
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
