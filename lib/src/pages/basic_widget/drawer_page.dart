import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Page'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountEmail: Text('dujin_2005@sina.com'),
              accountName: Text('I\'m Du Jin'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/maomi.jpg',
                ),
              ),
            ),
            DDDCard(
              title: 'title',
              subTitles: ['subTitles'],
              child: Container(),
            ),
            DDDCard(
              title: 'title',
              subTitles: ['subTitles'],
              child: Container(),
            ),
            DDDCard(
              title: 'title',
              subTitles: ['subTitles'],
              child: Container(),
            ),
          ],
        ),
      ),
      body: Center(
        child: DDDDescText(
          textList: [
            'Scaffold里面有两个Drawer:',
            '   drawer&endDrawer',
            '   加了Drawer之后会把Appbar的返回按钮干掉',
            '   可以在Appbar里面加leading把按钮加回来',
            '一般用于显示信息/抽屉式导航(稍微有点过时)',
          ],
        ),
      ),
    );
  }
}
