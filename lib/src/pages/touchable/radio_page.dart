import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class RadioPage extends StatefulWidget {
  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  String _radioSexGroupValue; //性别radio选中值
  String _radioGroupValue; // 答案radio选中值

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: 'Radio',
            subTitles: [
              'Emmm...其实没有「单行Radio」',
              'Row(Text...Radio)而已',
            ],
            child: Row(
              children: [
                Text(
                  '选择性别:',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Container(width: 20),
                Text(
                  '男',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Radio(
                  value: 'male',
                  groupValue: _radioSexGroupValue,
                  onChanged: (value) {
                    setState(() {
                      _radioSexGroupValue = value;
                    });
                  },
                ),
                Container(width: 40),
                Text(
                  '女',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Radio(
                  value: 'female',
                  groupValue: _radioSexGroupValue,
                  onChanged: (value) {
                    setState(() {
                      _radioSexGroupValue = value;
                    });
                  },
                ),
              ],
            ),
          ),
          DDDCard(
            title: 'RadioListTile',
            subTitles: [
              '通过controlAffinity: ListTileControlAffinity.trailing',
              '可以让Radio显示在尾部(右侧)',
            ],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '请选择一个答案吧:',
                  style: TextStyle(fontSize: 22),
                ),
                RadioListTile(
                  value: '1',
                  groupValue: _radioGroupValue,
                  activeColor: Colors.green,
                  title: Text(
                    '答案1',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text('我不可以选中哦'),
                  onChanged: null,
                ),
                RadioListTile(
                  value: '2',
                  groupValue: _radioGroupValue,
                  activeColor: Colors.green,
                  title: Text(
                    '答案2',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text('我是副标题'),
                  onChanged: (value) {
                    setState(() {
                      _radioGroupValue = value;
                    });
                  },
                ),
                RadioListTile(
                  value: '3',
                  groupValue: _radioGroupValue,
                  activeColor: Colors.green,
                  title: Text(
                    '答案3(我没有副标题)',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _radioGroupValue = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
