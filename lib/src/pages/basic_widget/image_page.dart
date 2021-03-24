import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: '本地图片',
            subTitles: [
              '默认显示',
            ],
            child: Image.asset('assets/images/maomi.jpg'),
          ),
          DDDCard(
            title: '本地图片',
            subTitles: [
              'fit: BoxFit.fitWidth',
              '长边顶格, 短边按比例缩放',
            ],
            child: Container(
              color: Colors.yellow,
              width: 300,
              height: 300,
              child: Image.asset(
                'assets/images/maomi.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          DDDCard(
            title: '本地图片',
            subTitles: [
              'fit: BoxFit.fitHeight',
              '短边顶格, 从中间截取',
            ],
            child: Container(
              color: Colors.yellow,
              width: 300,
              height: 300,
              child: Image.asset(
                'assets/images/maomi.jpg',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          DDDCard(
            title: '本地图片',
            subTitles: [
              'fit: BoxFit.contain(同fitWidth)',
              '长边顶格, 短边按比例缩放',
            ],
            child: Container(
              color: Colors.yellow,
              width: 300,
              height: 300,
              child: Image.asset(
                'assets/images/maomi.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          DDDCard(
            title: '本地图片',
            subTitles: [
              'fit: BoxFit.cover(同fitWidth)',
              '短边顶格, 从中间截取',
            ],
            child: Container(
              color: Colors.yellow,
              width: 300,
              height: 300,
              child: Image.asset(
                'assets/images/maomi.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          DDDCard(
            title: '本地图片',
            subTitles: [
              'fit: BoxFit.fill',
              '不按比例, 硬拉',
            ],
            child: Container(
              color: Colors.yellow,
              width: 300,
              height: 300,
              child: Image.asset(
                'assets/images/maomi.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          DDDCard(
            title: '本地图片',
            subTitles: [
              'fit: BoxFit.none',
              '直接从原图中心点抠出指定大小',
              '猫猫原图1920x1200, 容器大小300x300',
              '即从图片中心点抠出300x300的图',
            ],
            child: Container(
              color: Colors.yellow,
              width: 300,
              height: 300,
              child: Image.asset(
                'assets/images/maomi.jpg',
                fit: BoxFit.none,
              ),
            ),
          ),
          DDDCard(
            title: '网络图片',
            subTitles: [
              'Image.network()构造',
            ],
            child: Image.network('https://images.jindu.link/yese.jpg'),
          ),
        ],
      ),
    );
  }
}
