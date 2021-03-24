import 'package:flutter/material.dart';
import 'package:hello_flutter/res/my_icons.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class IconPage extends StatefulWidget {
  @override
  _IconPageState createState() => _IconPageState();
}

class _IconPageState extends State<IconPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Icon Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: 'Icon',
            subTitles: [
              '系统提供的Icon',
              '   fontFamily:MaterialIcons',
              'size调整大小',
              'color调整颜色',
            ],
            child: Wrap(
              spacing: 20,
              children: [
                Icon(
                  Icons.ac_unit,
                  size: 60,
                  color: Colors.blue,
                ),
                Icon(Icons.baby_changing_station),
                Icon(Icons.cached),
                Icon(Icons.dangerous),
                Icon(Icons.east),
                Icon(
                  Icons.face,
                  size: 50,
                ),
                Icon(
                  Icons.g_translate,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          DDDCard(
            title: '自定义Icon',
            subTitles: [
              '1.准备Icon的font文件(我用的https://www.fluttericon.com)',
              '2.字体文件放入工程',
              '3.pubspec.yaml配置fonts, 注意family和asset写对并pub get',
              '   特别需要注意的是fonts是flutter的下级结构, 如果写在同层会找不到字体',
              'flutter',
              '|-uses-material-design: true',
              '|-assets:',
              '|-fonts:',
              '4.引入IconData对应dart文件',
            ],
            child: Wrap(
              spacing: 20,
              children: [
                Icon(
                  MyIcons.heart,
                  size: 50,
                  color: Colors.blue,
                ),
                Icon(MyIcons.heart_circled),
                Icon(MyIcons.heart_empty),
                Icon(MyIcons.star),
                Icon(MyIcons.star_circled),
                Icon(
                  MyIcons.star_empty,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
