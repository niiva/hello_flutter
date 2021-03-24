import 'dart:async';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  List<int> _indexs = List.generate(20, (index) {
    return index;
  });

  Timer _t;

  @override
  void dispose() {
    super.dispose();
    _t.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GirdView Page'),
        actions: [
          IconButton(
            onPressed: () {
              Toast.show(
                '属于对Wrap布局的一个封装\n和Row、Column于Flex一个道理',
                context,
                duration: 5,
                gravity: Toast.CENTER,
              );
            },
            icon: Icon(Icons.ac_unit_sharp),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: _indexs.length,
        itemBuilder: (context, index) {
          /*当数据加载完毕时 追加数据*/
          if (index == _indexs.length - 1 && _indexs.length < 200) {
            _addIndex();
          }

          return Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: Text('$index'),
          );
        },
      ),
    );
  }

  void _addIndex() {
    // 延时加载
    _t = Timer(Duration(milliseconds: 1000), () {
      setState(() {
        _indexs.add(_indexs.length + 1);
      });
    });
  }
}
