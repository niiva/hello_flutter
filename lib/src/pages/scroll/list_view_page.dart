import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage>
    with SingleTickerProviderStateMixin {
  bool _showFloating;
  double _offsetY;
  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _showFloating = false;
    _offsetY = 0.0;

    _tabController = TabController(
      length: 4,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() {
        _showFloating = (3 == _tabController.index);
      });
    });

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _offsetY = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Page'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.amber,
          tabs: [
            Tab(text: 'ListView'),
            Tab(text: 'ListView.builder'),
            Tab(text: 'ListView.separated'),
            Tab(text: 'ScrollController'),
          ],
        ),
      ),
      floatingActionButton: _showFloating
          ? Opacity(
              child: Container(
                child: Text(
                  'offset:${_offsetY.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                color: Colors.black,
              ),
              opacity: 0.6,
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ListView(
            children: _listViewItem(),
          ),
          ListView.builder(
            itemCount: 20,
            itemBuilder: _listViewBuilder,
          ),
          ListView.separated(
            itemBuilder: _listViewBuilder2,
            separatorBuilder: _listViewSeparated,
            itemCount: 20,
          ),
          ListView.builder(
            itemCount: 100,
            itemBuilder: _listViewBuilder3,
            controller: _scrollController,
          ),
        ],
      ),
    );
  }

  /// ??????ListView
  List<Widget> _listViewItem() {
    return [
      DDDCard(
        title: '??????ListView',
        subTitles: [
          '?????????ListView????????????ScrollView??????',
          'scrollDirection???????????????(??????)',
          'children????????????????????????',
        ],
        child: Text('?????????Card'),
      ),
      Text('?????????Text'),
      Container(
        width: double.infinity,
        height: 200,
        color: Colors.yellow,
        child: Text('?????????Container'),
      ),
    ];
  }

  /// ListView.builder
  Widget _listViewBuilder(BuildContext context, int index) {
    if (0 == index) {
      return DDDCard(
        title: 'ListView.builder',
        subTitles: [
          'ListView.builder??????????????????',
          '???????????????, ????????????',
          '??????????????????index?????????????????????????????????',
          'itemCount??????????????????',
          '???????????????, ???????????????????????????ListView',
        ],
        child: Container(),
      );
    } else {
      return Container(
        width: double.infinity,
        height: 50,
        color: Colors.orange[100 + 100 * (index % 2)],
        child: Text('index-->$index'),
      );
    }
  }

  /// ListView.separated
  Widget _listViewBuilder2(BuildContext context, int index) {
    if (0 == index) {
      return DDDCard(
        title: 'ListView.separated',
        subTitles: [
          'ListView.separated???builder??????????????????',
          'separatorBuilder',
          '??????????????????Widget',
          '?????????????????????index?????????????????????',
          '   ?????????:',
          '   if(index % 2 == 0)??????20??????Container',
          '   else ??????20??????Container',
        ],
        child: Container(),
      );
    } else {
      return Container(
        width: double.infinity,
        height: 50,
        color: Colors.yellow,
        child: Text('index-->$index'),
      );
    }
  }

  Widget _listViewSeparated(BuildContext context, int index) {
    return Container(
      width: double.infinity,
      height: 20,
      color: index % 2 == 0 ? Colors.green : Colors.blue,
    );
  }

  /// ScrollController
  Widget _listViewBuilder3(BuildContext context, int index) {
    return Container(
      width: double.infinity,
      height: 80,
      color: Colors.green[100 + 100 * (index % 2)],
      child: Text('$index'),
    );
  }
}
