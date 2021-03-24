import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';
import 'package:hello_flutter/src/component/ddd_popup.dart';
import 'package:toast/toast.dart';

class PointerPage extends StatefulWidget {
  @override
  _PointerPageState createState() => _PointerPageState();
}

class _PointerPageState extends State<PointerPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  // tab1所用状态
  bool _switch1;
  bool _switch2;
  bool _switch3;

  // tab2所用状态
  bool _orangeClicked;
  bool _purpleClicked;
  bool _redClicked;
  OutsideContainer _oc;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _switch1 = false;
    _switch2 = false;
    _switch3 = false;

    _orangeClicked = false;
    _purpleClicked = false;
    _redClicked = false;
    _oc = OutsideContainer.none;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pointer Page'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.amber,
          tabs: [
            Tab(text: '禁用按钮的方式'),
            Tab(text: 'Absorb&Ignore区别'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _tabbarView1(),
          _tabbarView2(),
        ],
      ),
    );
  }

  Widget _tabbarView1() {
    return ListView(
      children: [
        DDDCard(
          title: '禁用按钮的方式1',
          subTitles: [
            '通过onPressed:null来控制',
          ],
          child: Center(
            child: Column(
              children: [
                CupertinoButton(
                  color: Colors.blue,
                  child: Text('ClickMe'),
                  onPressed: _switch1
                      ? null
                      : () {
                          Toast.show(
                            '点击了蓝色按钮',
                            context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.CENTER,
                          );
                        },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('禁用按钮'),
                    Switch(
                      value: _switch1,
                      onChanged: (value) {
                        setState(() {
                          _switch1 = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        DDDCard(
          title: '禁用按钮的方式2',
          subTitles: [
            '通过AbsorbPointer包裹Button',
            'absorbing默认为true(吸收)',
          ],
          child: Center(
            child: Column(
              children: [
                AbsorbPointer(
                  absorbing: _switch2,
                  child: CupertinoButton(
                    color: Colors.green,
                    child: Text('ClickMe'),
                    onPressed: () {
                      Toast.show(
                        '点击了绿色按钮',
                        context,
                        duration: Toast.LENGTH_SHORT,
                        gravity: Toast.BOTTOM,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('禁用按钮'),
                    Switch(
                      value: _switch2,
                      onChanged: (value) {
                        setState(() {
                          _switch2 = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        DDDCard(
          title: '禁用按钮的方式3',
          subTitles: [
            '通过IgnorePointer包裹Button',
            'ignoring默认为true(忽略)',
          ],
          child: Center(
            child: Column(
              children: [
                IgnorePointer(
                  ignoring: _switch3,
                  child: CupertinoButton(
                    color: Colors.red,
                    child: Text('ClickMe'),
                    onPressed: () {
                      Toast.show(
                        '点击了红色按钮',
                        context,
                        duration: Toast.LENGTH_SHORT,
                        gravity: Toast.BOTTOM,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('禁用按钮'),
                    Switch(
                      value: _switch3,
                      onChanged: (value) {
                        setState(() {
                          _switch3 = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _tabbarView2() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: Listener(
              onPointerDown: (e) {
                setState(() {
                  _orangeClicked = true;
                });
              },
              onPointerUp: (e) {
                setState(() {
                  _orangeClicked = false;
                });
              },
              child: Container(
                width: 300,
                height: 300,
                color: Colors.orange,
                alignment: Alignment.center,
                child: Listener(
                  onPointerDown: (e) {
                    setState(() {
                      _purpleClicked = true;
                    });
                  },
                  onPointerUp: (e) {
                    setState(() {
                      _purpleClicked = false;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: OutsideContainer.none == _oc,
                        child: Container(
                          width: 200,
                          height: 200,
                          color: Colors.purple,
                          alignment: Alignment.center,
                          child: Listener(
                            onPointerDown: (e) {
                              setState(() {
                                _redClicked = true;
                              });
                            },
                            onPointerUp: (e) {
                              setState(() {
                                _redClicked = false;
                              });
                            },
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: OutsideContainer.AbsorbPointer == _oc,
                        child: AbsorbPointer(
                          child: Container(
                            width: 200,
                            height: 200,
                            color: Colors.purple,
                            alignment: Alignment.center,
                            child: Listener(
                              onPointerDown: (e) {
                                setState(() {
                                  _redClicked = true;
                                });
                              },
                              onPointerUp: (e) {
                                setState(() {
                                  _redClicked = false;
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: OutsideContainer.IgnorePointer == _oc,
                        child: IgnorePointer(
                          child: Container(
                            width: 200,
                            height: 200,
                            color: Colors.purple,
                            alignment: Alignment.center,
                            child: Listener(
                              onPointerDown: (e) {
                                setState(() {
                                  _redClicked = true;
                                });
                              },
                              onPointerUp: (e) {
                                setState(() {
                                  _redClicked = false;
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  '这里用Listener对三个区域进行「按下」监听:',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  '红色区域接受到:${_redClicked ? '(√)' : '(×)'}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  '紫色区域接受到:${_purpleClicked ? '(√)' : '(×)'}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  '橙色区域接受到:${_orangeClicked ? '(√)' : '(×)'}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                DDDPopup(
                  title: '紫色区域包裹',
                  menuList: [
                    OutsideContainer.none,
                    OutsideContainer.AbsorbPointer,
                    OutsideContainer.IgnorePointer,
                  ],
                  valueChanged: (value) {
                    setState(() {
                      _oc = value;
                    });
                  },
                ),
                Visibility(
                  visible: OutsideContainer.none == _oc,
                  child: DDDDescText(
                    textList: [
                      '正常状态下',
                      '点击事件会逐层穿透',
                    ],
                  ),
                ),
                Visibility(
                  visible: OutsideContainer.AbsorbPointer == _oc,
                  child: DDDDescText(
                    textList: [
                      'Absorb包裹紫色',
                      'Absorb吸收了点击事件',
                      '「自身可以响应」',
                      '但是「阻止了子组件的响应」',
                    ],
                  ),
                ),
                Visibility(
                  visible: OutsideContainer.IgnorePointer == _oc,
                  child: DDDDescText(
                    textList: [
                      'Ignore包裹紫色',
                      'Ignore忽略了点击事件',
                      '「自身忽略响应」',
                      '同时「忽略子组件的响应」',
                    ],
                  ),
                ),
                Container(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

enum OutsideContainer {
  none,
  AbsorbPointer,
  IgnorePointer,
}
