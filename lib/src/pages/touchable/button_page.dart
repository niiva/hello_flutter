import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';
import 'package:toast/toast.dart';

class ButtonPage extends StatefulWidget {
  @override
  _ButtonPage createState() => _ButtonPage();
}

class _ButtonPage extends State<ButtonPage> {
  String _selectedValue; // DropDownButton的value
  int _clickedCount; // Floating按钮点击次数
  bool _switchValue1;
  bool _switchValue2;
  @override
  void initState() {
    super.initState();
    _clickedCount = 0; // Floating按钮点击次数
    _switchValue1 = false;
    _switchValue2 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Page'),
        actions: [
          PopupMenuButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text(
                    'popValue1',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  value: 'popValu1',
                ),
                PopupMenuItem(
                  child: Text(
                    'popValue2',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  value: [
                    '2-1',
                    '2-2',
                    '2-3',
                  ],
                ),
                PopupMenuItem(
                  child: Text(
                    'popValue3',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  value: {
                    'name': 'value3',
                  },
                ),
              ];
            },
            onSelected: (value) {
              Toast.show(
                'value is $value',
                context,
                duration: Toast.LENGTH_SHORT,
                gravity: Toast.CENTER,
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          DDDCard(
            title: 'ButtonBar',
            subTitles: [
              '一般用于底栏, 如订单确认/取消...',
            ],
            child: ButtonBar(
              children: [
                ElevatedButton(
                  onPressed: () => {
                    Toast.show(
                      "ButtonBar->Button1",
                      context,
                      duration: Toast.LENGTH_SHORT,
                      gravity: Toast.CENTER,
                    )
                  },
                  child: Text(
                    'Button1',
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {
                    Toast.show(
                      "ButtonBar->Button2",
                      context,
                      duration: Toast.LENGTH_SHORT,
                      gravity: Toast.CENTER,
                    )
                  },
                  child: Text(
                    'Button2',
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {
                    Toast.show(
                      "ButtonBar->Button3",
                      context,
                      duration: Toast.LENGTH_SHORT,
                      gravity: Toast.CENTER,
                    )
                  },
                  child: Text(
                    'Button3',
                  ),
                )
              ],
            ),
          ),
          DDDCard(
            title: 'CupertinoButton',
            subTitles: [
              'iOS风格的Button',
            ],
            child: CupertinoButton(
              color: Colors.green,
              child: Text('CupertinoButton'),
              onPressed: () {
                Toast.show(
                  "CupertinoButton",
                  context,
                  duration: Toast.LENGTH_SHORT,
                  gravity: Toast.CENTER,
                );
              },
            ),
          ),
          DDDCard(
            title: 'DropDownButton',
            subTitles: [
              'isExpanded设置是否水平方向填充(横向铺满)',
              'style字段只能设置文字样式(图标无效)',
            ],
            child: DropdownButton(
              hint: Text('请选择'),
              value: _selectedValue,
              style: TextStyle(
                color: Colors.red,
              ),
              items: [
                DropdownMenuItem(
                  value: '1',
                  child: Text(
                    'value1',
                  ),
                ),
                DropdownMenuItem(
                  value: '2',
                  child: Text(
                    'value2',
                  ),
                ),
                DropdownMenuItem(
                  value: '3',
                  child: Text(
                    'value3',
                  ),
                ),
                DropdownMenuItem(
                  value: '4',
                  child: Icon(Icons.access_alarm_sharp),
                ),
              ],
              onChanged: (selectedValue) {
                setState(() {
                  _selectedValue = selectedValue;
                });
              },
            ),
          ),
          DDDCard(
            title: 'FloatingActionButton',
            subTitles: [
              '通过Scaffod的floatingActionButton设置',
              '通过floatingActionButtonLocation字段可以调整位置'
            ],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '(点击了$_clickedCount次)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.lightGreen,
                  ),
                ),
                Text(
                  '按钮在右下角(长按有惊喜)',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          DDDCard(
            title: 'IconButton',
            subTitles: [
              '图标按钮没有文字说明, 一般会搭配tooltip使用',
              '长按试试?',
            ],
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.all(10),
                  child: IconButton(
                      icon: Icon(Icons.ac_unit),
                      color: Colors.red,
                      tooltip: '按那么久干嘛?',
                      onPressed: () => {}),
                ),
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.all(10),
                  child: IconButton(
                      icon: Icon(Icons.baby_changing_station),
                      color: Colors.blue,
                      tooltip: '再长按就把你吃掉!',
                      onPressed: () => {}),
                ),
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.all(10),
                  child: IconButton(
                      icon: Icon(Icons.cached),
                      color: Colors.green,
                      tooltip: '你是哪块小饼干!',
                      onPressed: () => {}),
                )
              ],
            ),
          ),
          DDDCard(
            title: 'PopupMenuButton',
            subTitles: [
              '通过Scaffod的actions设置',
            ],
            child: Text(
              '按钮在右上角',
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
              ),
            ),
          ),
          DDDCard(
            title: 'ElevatedButton',
            subTitles: [
              'Emmm...没看出有什么特别的',
            ],
            child: ElevatedButton(
              onPressed: () => {
                Toast.show(
                  "ElevatedButton",
                  context,
                  duration: Toast.LENGTH_SHORT,
                  gravity: Toast.CENTER,
                ),
              },
              child: Container(
                width: 80,
                height: 40,
                child: Row(
                  children: [
                    Icon(Icons.dangerous),
                    Text('随便点'),
                  ],
                ),
              ),
            ),
          ),
          DDDCard(
            title: 'MaterialButton',
            subTitles: [
              '蓝色:',
              '   shape->CircleBorder',
              '橘色:',
              '   shape->RoundedRectangleBorder',
              '绿色:',
              '   shape->BeveledRectangleBorder',
            ],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: MaterialButton(
                    onPressed: () {
                      Toast.show(
                        "圆形",
                        context,
                        duration: Toast.LENGTH_SHORT,
                        gravity: Toast.CENTER,
                      );
                    },
                    child: Text(
                      '圆形',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.blue,
                    shape: CircleBorder(),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: MaterialButton(
                    onPressed: () {
                      Toast.show(
                        "圆角",
                        context,
                        duration: Toast.LENGTH_SHORT,
                        gravity: Toast.CENTER,
                      );
                    },
                    child: Text(
                      '圆角',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: MaterialButton(
                    onPressed: () {
                      Toast.show(
                        "倒角",
                        context,
                        duration: Toast.LENGTH_SHORT,
                        gravity: Toast.CENTER,
                      );
                    },
                    child: Text(
                      '倒角',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.green,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          DDDCard(
            title: 'Switch',
            subTitles: [
              'Emmm...这个我觉得也算按钮, 就放这里了',
              'Switch本身是没法调整大小的',
              '(源码中宽高是const写死的,???不理解)',
              '但是可以通过Transform.scale调整其大小',
            ],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Switch(
                  value: _switchValue1,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      _switchValue1 = value;
                    });
                  },
                ),
                Transform.scale(
                  scale: 1.8,
                  child: Switch(
                    value: _switchValue2,
                    activeColor: Colors.green,
                    onChanged: (value) {
                      setState(() {
                        _switchValue2 = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        tooltip: '我就是惊喜^ ^',
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
        backgroundColor: Colors.orange,
        onPressed: () => {
          setState(() {
            _clickedCount++;
          }),
        },
      ),
    );
  }
}
