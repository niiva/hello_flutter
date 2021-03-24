import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class DismissiblePage extends StatefulWidget {
  @override
  _DismissiblePageState createState() => _DismissiblePageState();
}

class _DismissiblePageState extends State<DismissiblePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dismissible Page'),
      ),
      body: ListView(
        children: [
          Dismissible(
            key: ValueKey('1'),
            dismissThresholds: {
              DismissDirection.endToStart: 0.6,
            },
            child: DDDCard(
              title: 'Dismissible',
              subTitles: [
                '侧滑消失的组件',
                'background左侧底部组件',
                'secondaryBackground右侧底部组件',
                'confirmDismiss异步方法',
                '   这里右侧加了一个dialog',
                '   左侧返回false(不可删除)',
                'dismissThresholds控制生效距离(<1.0)',
                '   这里设置了DismissDirection.endToStart: 0.6',
                '   即从右向左滑动60%的长度才能触发dismiss',
                '   默认40%(0.4)',
              ],
              child: Container(),
            ),
            background: Container(
              alignment: Alignment.centerLeft,
              color: Colors.green,
              child: Text('background'),
            ),
            secondaryBackground: Container(
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: Text('secondaryBackground'),
            ),
            confirmDismiss: (direction) async {
              if (DismissDirection.endToStart == direction) {
                return await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    title: Text('提示'),
                    content: Text('你确定要删除吗'),
                    actions: <Widget>[
                      MaterialButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text('确定'),
                      ),
                      MaterialButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text('取消'),
                      ),
                    ],
                  ),
                );
              } else {
                return false;
              }
            },
          ),
        ],
      ),
    );
  }
}
