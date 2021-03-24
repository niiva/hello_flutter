import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class CheckBoxPage extends StatefulWidget {
  @override
  _CheckBoxPageState createState() => _CheckBoxPageState();
}

class _CheckBoxPageState extends State<CheckBoxPage> {
  bool _checkBoxValue1;
  bool _checkBoxValue2;
  bool _checkBoxValue3;
  bool _checkBoxValue4;

  bool _checkBoxTileValue1;
  bool _checkBoxTileValue2;

  @override
  void initState() {
    super.initState();
    _checkBoxValue1 = false;
    _checkBoxValue2 = true;
    _checkBoxValue3 = false;
    _checkBoxValue4 = false;

    _checkBoxTileValue1 = false;
    _checkBoxTileValue2 = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBox Page'),
      ),
      body: Column(
        children: [
          DDDCard(
            title: 'CheckBox',
            subTitles: [
              '纯粹的checkbox组件',
              'value只有true、false',
            ],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Checkbox(
                  value: _checkBoxValue1,
                  onChanged: (value) {
                    setState(() {
                      _checkBoxValue1 = value;
                    });
                  },
                ),
                Checkbox(
                  value: _checkBoxValue2,
                  onChanged: (value) {
                    setState(() {
                      _checkBoxValue2 = value;
                    });
                  },
                ),
                Checkbox(
                  value: _checkBoxValue3,
                  onChanged: (value) {
                    setState(() {
                      _checkBoxValue3 = value;
                    });
                  },
                ),
                Checkbox(
                  value: _checkBoxValue4,
                  onChanged: (value) {
                    setState(() {
                      _checkBoxValue4 = value;
                    });
                  },
                ),
              ],
            ),
          ),
          DDDCard(
            title: 'CheckboxListTile',
            subTitles: [
              '与RadioListTile原理基本一致',
              '通过controlAffinity: ListTileControlAffinity.leading',
              '可以让CheckBox显示在尾部(左侧)',
            ],
            child: Column(
              children: [
                CheckboxListTile(
                  title: Text('标题1'),
                  subtitle: Text('副标题1'),
                  value: _checkBoxTileValue1,
                  onChanged: (value) {
                    setState(() {
                      _checkBoxTileValue1 = value;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('标题2'),
                  subtitle: Text('副标题3'),
                  value: _checkBoxTileValue2,
                  onChanged: (value) {
                    setState(() {
                      _checkBoxTileValue2 = value;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('标题3'),
                  subtitle: Text('不可选中'),
                  value: false,
                  onChanged: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
