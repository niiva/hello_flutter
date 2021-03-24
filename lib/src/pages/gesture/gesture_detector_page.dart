import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class GestureDetectorPage extends StatefulWidget {
  @override
  _GestureDetectorPageState createState() => _GestureDetectorPageState();
}

class _GestureDetectorPageState extends State<GestureDetectorPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  // tap
  Offset _tapGlobalP;
  Offset _tapLocalP;

  // pan
  Offset _panGlobalP;
  Offset _panLocalP;
  Velocity _panV;

  // scale
  double _scale;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );

    _tapGlobalP = Offset.zero;
    _tapLocalP = Offset.zero;

    _panGlobalP = Offset.zero;
    _panLocalP = Offset.zero;
    _panV = Velocity.zero;

    _scale = 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector Page'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: '点击'),
            Tab(text: '移动'),
            Tab(text: '缩放'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        // 禁止左右滑动
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 100),
            child: DDDCard(
              title: '点击事件',
              subTitles: [
                '点击:',
                '常用「点击、双击、长按、按压」',
                '   「按压(ForcePress)」只有在3DTouch设备上才会触发',
                '其处理方法类似, 这里注意一下「绝对」和「相对」',
                '相对坐标:$_tapLocalP',
                '绝对坐标:$_tapGlobalP',
              ],
              child: GestureDetector(
                onTapDown: (details) {
                  setState(() {
                    _tapGlobalP = details.globalPosition;
                    _tapLocalP = details.localPosition;
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.yellow,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 100),
            child: DDDCard(
              title: 'Pan',
              subTitles: [
                '能够捕获指针的移动',
                '相对坐标:$_panLocalP',
                '绝对坐标:$_panGlobalP',
                '最终速度:$_panV',
              ],
              child: GestureDetector(
                onPanDown: (details) {
                  setState(() {
                    _panGlobalP = details.globalPosition;
                    _panLocalP = details.localPosition;
                  });
                },
                onPanUpdate: (details) {
                  setState(() {
                    _panGlobalP = details.globalPosition;
                    _panLocalP = details.localPosition;
                  });
                },
                onPanEnd: (details) {
                  setState(() {
                    _panV = details.velocity;
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.yellow,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 100),
            child: DDDCard(
              title: '缩放',
              subTitles: [
                'onScaleUpdate',
                'detail.scale:$_scale',
              ],
              child: GestureDetector(
                onScaleUpdate: (detail) {
                  setState(() {
                    _scale = detail.scale.clamp(0.5, 10);
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 300,
                  alignment: Alignment.center,
                  color: Colors.yellow,
                  child: Transform.scale(
                    scale: _scale,
                    child: Image.asset(
                      'assets/images/katong.jpg',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
