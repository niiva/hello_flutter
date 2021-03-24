import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';

class TabbarPage extends StatefulWidget {
  @override
  _TabbarPageState createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 10,
      vsync: this,
    );
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
        title: Text('Tabbar Page'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.amber,
          tabs: [
            Tab(text: 'Tips'),
            Tab(text: 'tab2'),
            Tab(text: 'tab3'),
            Tab(text: 'tab4'),
            Tab(text: 'tab5'),
            Tab(text: 'tab6'),
            Tab(text: 'tab7'),
            Tab(text: 'tab8'),
            Tab(text: 'tab9'),
            Tab(text: 'tab10'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
            child: DDDDescText(
              textList: [
                'TabbarView配合Tabbar使用',
                '创建TabController的类需要',
                '   with SingleTickerProviderStateMixin',
                '用法很简单, Tabbar和TabbarView',
                '   指定同一个Controller就行了',
              ],
            ),
          ),
          Center(
            child: Text('It\'s tab2View'),
          ),
          Center(
            child: Text('It\'s tab3View'),
          ),
          Center(
            child: Text('It\'s tab4View'),
          ),
          Center(
            child: Text('It\'s tab5View'),
          ),
          Center(
            child: Text('It\'s tab6View'),
          ),
          Center(
            child: Text('It\'s tab7View'),
          ),
          Center(
            child: Text('It\'s tab8View'),
          ),
          Center(
            child: Text('It\'s tab9View'),
          ),
          Center(
            child: Text('It\'s tab10View'),
          ),
        ],
      ),
    );
  }
}
