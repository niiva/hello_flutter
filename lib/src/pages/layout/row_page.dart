import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';
import 'package:hello_flutter/src/component/ddd_popup.dart';
import 'package:hello_flutter/src/component/ddd_row_add_remove.dart';

class RowPage extends StatefulWidget {
  @override
  _RowPageState createState() => _RowPageState();
}

class _RowPageState extends State<RowPage> {
  int _count;
  MainAxisAlignment _mainAxisAlignment;
  CrossAxisAlignment _crossAxisAlignment;

  @override
  void initState() {
    super.initState();
    _count = 3;
    _mainAxisAlignment = MainAxisAlignment.start;
    _crossAxisAlignment = CrossAxisAlignment.start;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row Page'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Row(
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
                    DDDDescText(
                      textList: [
                        'Row继承自Flex, 相当于Flex横向排列',
                      ],
                    ),
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
                    Container(
                      height: 100,
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
        width: width / _count,
        height: width,
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
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      );
      wList.add(c);
    }
    return wList;
  }
}
