import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_popup.dart';
import 'package:hello_flutter/src/component/ddd_row_add_remove.dart';
import 'package:hello_flutter/src/component/ddd_row_radio.dart';

class FlexPage extends StatefulWidget {
  @override
  _FlexPageState createState() => _FlexPageState();
}

class _FlexPageState extends State<FlexPage> {
  String _axis;
  int _count;
  MainAxisAlignment _mainAxisAlignment;
  CrossAxisAlignment _crossAxisAlignment;

  @override
  void initState() {
    super.initState();
    _axis = 'h';
    _count = 3;
    _mainAxisAlignment = MainAxisAlignment.start;
    _crossAxisAlignment = CrossAxisAlignment.start;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flex Page'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Flex(
                direction: 'h' == _axis ? Axis.horizontal : Axis.vertical,
                mainAxisAlignment: _mainAxisAlignment,
                crossAxisAlignment: _crossAxisAlignment,
                children:
                    this._flexChildren(MediaQuery.of(context).size.width / 2),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DDDRowAddRemove(
                      title: '组件数',
                      defaultValue: 3,
                      stepValue: 1,
                      maxValue: 10,
                      minValue: 0,
                      valueChanged: (value) {
                        setState(() {
                          _count = value.round();
                        });
                      },
                    ),
                    DDDRowRadio(
                      title: '布局方向',
                      leftTitle: '横向',
                      rightTitle: '竖向',
                      leftClicked: () {
                        setState(() {
                          _axis = 'h';
                        });
                      },
                      rightClicked: () {
                        setState(() {
                          _axis = 'v';
                        });
                      },
                    ),
                    DDDPopup(
                      title: '主轴',
                      menuList: [
                        MainAxisAlignment.start,
                        MainAxisAlignment.center,
                        MainAxisAlignment.end,
                        MainAxisAlignment.spaceAround,
                        MainAxisAlignment.spaceBetween,
                        MainAxisAlignment.spaceEvenly,
                      ],
                      valueChanged: (value) {
                        setState(() {
                          _mainAxisAlignment = value;
                        });
                      },
                    ),
                    DDDPopup(
                      title: '交叉轴',
                      menuList: [
                        CrossAxisAlignment.start,
                        CrossAxisAlignment.center,
                        CrossAxisAlignment.end,
                        CrossAxisAlignment.stretch,
                      ],
                      valueChanged: (value) {
                        setState(() {
                          _crossAxisAlignment = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _flexChildren(double width) {
    List<Widget> wList = [];
    for (int i = 0; i < _count; i++) {
      Container c = Container(
        width: 'h' == _axis ? width / _count : width,
        height: 'h' == _axis ? width : width / _count,
        child: Center(
          child: Text(
            '${i + 1}',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      );
      wList.add(c);
    }
    return wList;
  }
}
