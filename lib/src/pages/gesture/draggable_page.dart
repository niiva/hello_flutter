import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';
import 'package:hello_flutter/src/component/ddd_popup.dart';
import 'package:toast/toast.dart';

class DraggablePage extends StatefulWidget {
  @override
  _DraggablePageState createState() => _DraggablePageState();
}

class _DraggablePageState extends State<DraggablePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  // tab1所用状态
  var _axis;

  // tab2所用状态
  _Info _data;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );

    _axis = null;

    _data = _Info(
      name: '拽过来',
      color: Colors.grey[500],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable Page'),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: [
            Tab(child: Text('Draggable')),
            Tab(child: Text('DragTarget')),
            Tab(child: Text('LongPressDraggable')),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _draggableTV(),
          _dragTargetTV(),
          _longPressDraggableTV(),
        ],
      ),
    );
  }

  Widget _draggableTV() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: Draggable(
              axis: _axis,
              child: _draggableBox(
                _Info(
                  name: '拽我',
                  color: Colors.red,
                ),
              ),
              feedback: _draggableBox(
                _Info(
                  name: '拽我',
                  color: Colors.green,
                ),
              ),
              childWhenDragging: _draggableBox(
                _Info(
                  name: '拽我',
                  color: Colors.grey,
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
                DDDPopup(
                  title: '拖拽方向',
                  menuList: [
                    '不限制',
                    Axis.horizontal,
                    Axis.vertical,
                  ],
                  valueChanged: (value) {
                    if ('不限制' == value) {
                      _axis = null;
                    } else {
                      _axis = value;
                    }
                    setState(() {});
                  },
                ),
                DDDDescText(
                  textList: [
                    'Draggable',
                    '   child原始组件(红色)',
                    '   feedback反馈组件, 即跟随移动的组件(绿色)',
                    '   childWhenDragging拖动时的原始组件(灰色)',
                    '   axis移动轴, 即限制拖动方向(只可横/竖拖动)',
                    '',
                    '回调方法:',
                    '   onDragStarted:开始回调',
                    '   onDragUpdate:拖动中',
                    '   onDraggableCanceled:取消(如拖到屏幕外)',
                    '   onDragEnd:结束',
                    '   onDragCompleted:完成',
                    '       (被target accept会触发, 见->「dragTarget」)',
                    '',
                    '组件上的文字外层需要加Material',
                    '否则会出现双下划线效果',
                  ],
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

  Widget _dragTargetTV() {
    _Info info1 = _Info(
      name: '1',
      color: Colors.red,
    );

    _Info info2 = _Info(
      name: '2',
      color: Colors.blue,
    );

    _Info info3 = _Info(
      name: '3',
      color: Colors.green,
    );

    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Draggable<_Info>(
                    axis: _axis,
                    data: info1,
                    child: _draggableBox(info1),
                    feedback: _draggableBox(info1),
                    childWhenDragging: _draggableBox(info1),
                  ),
                  Draggable<_Info>(
                    axis: _axis,
                    data: info2,
                    child: _draggableBox(info2),
                    feedback: _draggableBox(info2),
                    childWhenDragging: _draggableBox(info2),
                  ),
                  Draggable<_Info>(
                    axis: _axis,
                    data: info3,
                    child: _draggableBox(info3),
                    feedback: _draggableBox(info3),
                    childWhenDragging: _draggableBox(info3),
                  ),
                ],
              ),
              DragTarget(
                builder: _dragTargetBuilder,
                onWillAccept: (data) {
                  if (Colors.green == data.color) {
                    Toast.show(
                      '绿色的不要',
                      context,
                      duration: Toast.LENGTH_SHORT,
                      gravity: Toast.BOTTOM,
                    );
                    return false;
                  } else {
                    return true;
                  }
                },
                onAccept: (data) {
                  setState(() {
                    _data = data;
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DDDDescText(
                  textList: [
                    'DragTarget',
                    'onWillAccept返回true/false决定是否接收data',
                    '   这里做了判断, 绿色的不接收(返回false)',
                    'onAccept接收回调, 用于处理数据',
                    '',
                    'builder目标区域的构建, 参数:',
                    '   candidateData为onWillAccept为true时的data',
                    '   rejectedData为onWillAccept为false时的data',
                  ],
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

  Widget _longPressDraggableTV() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: LongPressDraggable(
              axis: _axis,
              child: _draggableBox(
                _Info(
                  name: '长按拽',
                  color: Colors.red,
                ),
              ),
              feedback: _draggableBox(
                _Info(
                  name: '长按拽',
                  color: Colors.green,
                ),
              ),
              childWhenDragging: _draggableBox(
                _Info(
                  name: '长按拽',
                  color: Colors.grey,
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
                DDDDescText(
                  textList: [
                    'LongPressDraggable',
                    '与Draggable用法无差别',
                    '只是触发方式是长按',
                    'delay设置触发时间'
                  ],
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

  Widget _draggableBox(_Info info) {
    return Container(
      width: 100,
      height: 100,
      color: info.color,
      alignment: Alignment.center,
      child: Material(
        color: Color.fromRGBO(0, 0, 0, 0),
        child: Text(
          info.name,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget _dragTargetBuilder(
    BuildContext context,
    List<_Info> candidateData,
    List<dynamic> rejectedData,
  ) {
    return Container(
      width: 100,
      height: 100,
      color: _data.color,
      alignment: Alignment.center,
      child: Text('${_data.name}'),
    );
  }
}

class _Info {
  String name;
  Color color;

  _Info({
    @required this.name,
    @required this.color,
  });
}
