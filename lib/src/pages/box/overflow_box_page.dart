import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class OverflowBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OverflowBox Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
              title: 'OverflowBox',
              subTitles: [
                'OverflowBox允许子组件溢出容器',
                '有以下属性可使用:',
                'alignment',
                'minWidth',
                'maxWidth',
                'minHeight',
                'maxHeight',
                '据说maxWidth和maxHeight不能小于父容器',
                '我做测试的时候并没有报错???',
              ],
              child: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  color: Colors.yellow,
                  child: OverflowBox(
                    maxWidth: double.infinity,
                    child: Container(
                      height: 100,
                      width: 300,
                      color: Colors.red,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
