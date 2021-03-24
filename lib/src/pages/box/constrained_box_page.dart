import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class ConstrainedBoxPage extends StatefulWidget {
  @override
  _ConstrainedBoxPageState createState() => _ConstrainedBoxPageState();
}

class _ConstrainedBoxPageState extends State<ConstrainedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConstrainedBox Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: 'ConstrainedBox',
            subTitles: [
              '这里3个Container的宽高都是100',
              '使用UnconstrainedBox解除之前的限制',
              '并用BoxConstraints加了新的约束(minWidth)',
              'UnconstrainedBox(',
              '    child: ConstrainedBox(',
              '      constraints: BoxConstraints(minWidth: 200)',
              '      child: Container(',
              '       ...',
            ],
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                ),
                UnconstrainedBox(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 200),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
