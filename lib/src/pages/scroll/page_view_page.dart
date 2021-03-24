import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  @override
  _PageViewPageState createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  int _pageNum;
  ScrollPhysics _physics;

  @override
  void initState() {
    super.initState();
    _pageNum = 1;
    _physics = BouncingScrollPhysics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView Page(第$_pageNum页)'),
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
                        'BouncingScrollPhysics',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      value: BouncingScrollPhysics()),
                  PopupMenuItem(
                      child: Text(
                        'ClampingScrollPhysics',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      value: ClampingScrollPhysics()),
                ];
              },
              onSelected: (value) {
                _physics = value;
              }),
        ],
      ),
      body: PageView(
        physics: _physics,
        children: [
          _page1(),
          _page2(),
          _page3(),
        ],
        onPageChanged: (value) {
          setState(() {
            _pageNum = value + 1;
          });
        },
      ),
    );
  }

  Widget _page1() {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text(
          '第1页',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Widget _page2() {
    return Container(
      color: Colors.green,
      child: Center(
        child: Text(
          '第2页',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Widget _page3() {
    return Container(
      color: Colors.purple,
      child: Center(
        child: Text(
          '第3页',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
