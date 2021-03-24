import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class RefreshIndicatorPage extends StatefulWidget {
  @override
  _RefreshIndicatorPageState createState() => _RefreshIndicatorPageState();
}

class _RefreshIndicatorPageState extends State<RefreshIndicatorPage> {
  int _count;

  @override
  void initState() {
    super.initState();
    _count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RefreshIndicator Page'),
      ),
      body: RefreshIndicator(
        child: ListView(
          children: [
            DDDCard(
              title: '下拉刷新',
              subTitles: [
                '系统封装好的下拉刷新',
                '可以改颜色、线条',
                '没什么好说的',
              ],
              child: Center(
                child: Text('刷新次数:$_count'),
              ),
            ),
          ],
        ),
        onRefresh: _onRefresh,
      ),
    );
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _count++;
    });
  }
}
