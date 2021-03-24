import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';
import 'package:toast/toast.dart';

class ChipPage extends StatefulWidget {
  @override
  _ChipPageState createState() => _ChipPageState();
}

class _ChipPageState extends State<ChipPage> {
  bool _choice1;
  bool _choice2;
  bool _choice3;

  @override
  void initState() {
    super.initState();
    _choice1 = true;
    _choice2 = false;
    _choice3 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chip Page',
        ),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: 'Chip',
            subTitles: [
              'label是required字段',
              '圆形头像avatar:',
              '   avatar:CircleAvatar',
              '   abelPadding: EdgeInsets.all(15)',
              '',
              '带有删除按钮的Chip:',
              '   deleteIcon设置按钮Icon',
              '   onDeleted处理点击事件, 如果不实现, deleteIcon不显示',
              '',
              '圆角矩形Chip:',
              '   通过shape: RoundedRectangleBorder设置',
              '   同样可以设置成其他形状',
              '',
              '带阴影的Chip:',
              '   elevation控制阴影范围',
              '   shadowColor控制阴影颜色',
            ],
            child: Wrap(
              spacing: 10,
              children: [
                Chip(
                  label: Text('原始Chip'),
                ),
                Chip(
                  labelPadding: EdgeInsets.all(15),
                  label: Text('带有avatar的Chip'),
                  avatar: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/maomi.jpg',
                    ),
                    radius: 30,
                  ),
                ),
                Chip(
                  label: Text('带有删除按钮的Chip'),
                  deleteIcon: Icon(Icons.close),
                  onDeleted: () {
                    Toast.show(
                      '点击了删除按钮',
                      context,
                      duration: Toast.LENGTH_SHORT,
                      gravity: Toast.CENTER,
                    );
                  },
                ),
                Chip(
                  label: Text('圆角矩形Chip'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                ),
                Chip(
                  label: Text('带阴影的Chip'),
                  shadowColor: Colors.grey,
                  elevation: 10.0,
                ),
              ],
            ),
          ),
          DDDCard(
            title: 'ActionChip',
            subTitles: [
              '比普通Chip多了一个onPressed事件',
              '不能设置deleteIcon和事件',
            ],
            child: Wrap(
              children: [
                ActionChip(
                  label: Text('ActionChip'),
                  backgroundColor: Colors.orange,
                  elevation: 10,
                  shadowColor: Colors.orange,
                  onPressed: () {
                    Toast.show(
                      '点击了ActionChip',
                      context,
                      duration: Toast.LENGTH_SHORT,
                      gravity: Toast.CENTER,
                    );
                  },
                ),
              ],
            ),
          ),
          DDDCard(
            title: 'ChoiceChip',
            subTitles: [
              '比普通Chip多了一个onSelected事件, 返回value变化',
              'selected设置选中状态true/false',
              'onSelected设置null不可选',
              '不能设置deleteIcon和事件',
            ],
            child: Wrap(
              spacing: 10,
              children: [
                ChoiceChip(
                  label: Text('ChoiceChip1'),
                  selected: _choice1,
                  elevation: 10,
                  shadowColor: Colors.grey,
                  onSelected: (value) {
                    setState(() {
                      _choice1 = value;
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('ChoiceChip2'),
                  selected: _choice2,
                  elevation: 10,
                  shadowColor: Colors.grey,
                  onSelected: (value) {
                    setState(() {
                      _choice2 = value;
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('不可选'),
                  selected: _choice3,
                  elevation: 10,
                  shadowColor: Colors.grey,
                  onSelected: null,
                ),
              ],
            ),
          ),
          DDDCard(
            title: 'FilterChip',
            subTitles: [
              '比ChoiceChip多了一个选中的√',
              '不能设置deleteIcon和事件',
            ],
            child: Wrap(
              spacing: 10,
              children: [
                FilterChip(
                  label: Text('FilterChip1'),
                  selected: _choice1,
                  elevation: 10,
                  shadowColor: Colors.grey,
                  onSelected: (value) {
                    setState(() {
                      _choice1 = value;
                    });
                  },
                ),
                FilterChip(
                  label: Text('FilterChip2'),
                  selected: _choice2,
                  elevation: 10,
                  shadowColor: Colors.grey,
                  onSelected: (value) {
                    setState(() {
                      _choice2 = value;
                    });
                  },
                ),
                FilterChip(
                  label: Text('不可选'),
                  selected: _choice3,
                  elevation: 10,
                  shadowColor: Colors.grey,
                  onSelected: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
