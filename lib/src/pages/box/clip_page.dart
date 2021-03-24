import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';
import 'package:toast/toast.dart';

class ClipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clip Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: '原图',
            subTitles: ['下面的裁剪都是以此图为基础的', '猫咪可以点击的哦~'],
            child: GestureDetector(
              child: Image.asset(
                'assets/images/mengmao.jpg',
                fit: BoxFit.contain,
                width: double.infinity,
              ),
              onTap: () {
                Toast.show(
                  '点击了小猫咪',
                  context,
                  duration: Toast.LENGTH_SHORT,
                  gravity: Toast.CENTER,
                );
              },
            ),
          ),
          DDDCard(
            title: 'ClipRect',
            subTitles: [
              '矩形裁剪',
              '「点击区域也会跟着被剪裁」',
              '   clipper继承CustomClipper<Rect>',
              '   这里返回的Rect.fromCenter',
              '   width:150,height:150',
            ],
            child: ClipRect(
              clipper: _RectClipper(),
              child: GestureDetector(
                child: Image.asset(
                  'assets/images/mengmao.jpg',
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
                onTap: () {
                  Toast.show(
                    '点击了小猫咪',
                    context,
                    duration: Toast.LENGTH_SHORT,
                    gravity: Toast.CENTER,
                  );
                },
              ),
            ),
          ),
          DDDCard(
            title: 'ClipRRect',
            subTitles: [
              '圆角矩形裁剪',
              '「点击区域也会跟着被剪裁」',
              '   clipper继承CustomClipper<RRect>',
              '   RRect.fromRectAndRadius',
              '       Rect.fromCenter',
              '       width:150,height:150',
              '       Radius.circular(20),',
              '       如果这里Radius.circular(50)将会得到一个圆形'
            ],
            child: ClipRRect(
              clipper: _RRectClipper(),
              child: GestureDetector(
                child: Image.asset(
                  'assets/images/mengmao.jpg',
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
                onTap: () {
                  Toast.show(
                    '点击了小猫咪',
                    context,
                    duration: Toast.LENGTH_SHORT,
                    gravity: Toast.CENTER,
                  );
                },
              ),
            ),
          ),
          DDDCard(
            title: 'ClipOval',
            subTitles: [
              '椭圆裁剪',
              '「点击区域也会跟着被剪裁」',
              '   clipper继承CustomClipper<Rect>',
              '   这里返回的Rect.fromCenter',
              '   width:300,height:200',
              '   如果width=height就得到了一个圆形',
            ],
            child: ClipOval(
              clipper: _OvalClipper(),
              child: GestureDetector(
                child: Image.asset(
                  'assets/images/mengmao.jpg',
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
                onTap: () {
                  Toast.show(
                    '点击了小猫咪',
                    context,
                    duration: Toast.LENGTH_SHORT,
                    gravity: Toast.CENTER,
                  );
                },
              ),
            ),
          ),
          DDDCard(
            title: 'ClipPath',
            subTitles: [
              'Path裁剪',
              '「点击区域也会跟着被剪裁」',
              '   clipper继承CustomClipper<Path>',
              '   这里绘制了一个三角形'
            ],
            child: ClipPath(
              clipper: _PathClipper(),
              child: GestureDetector(
                child: Image.asset(
                  'assets/images/mengmao.jpg',
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
                onTap: () {
                  Toast.show(
                    '点击了小猫咪',
                    context,
                    duration: Toast.LENGTH_SHORT,
                    gravity: Toast.CENTER,
                  );
                },
              ),
            ),
          ),
          DDDCard(
            title: 'ClipPath',
            subTitles: [
              'Path裁剪',
              '「点击区域也会跟着被剪裁」',
              '   clipper继承CustomClipper<Path>',
              '   三阶贝塞尔曲线CubicTo',
              '   这里绘制了一个心形'
            ],
            child: ClipPath(
              clipper: _HeartClipper(),
              child: GestureDetector(
                child: Image.asset(
                  'assets/images/mengmao.jpg',
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
                onTap: () {
                  Toast.show(
                    '点击了小猫咪',
                    context,
                    duration: Toast.LENGTH_SHORT,
                    gravity: Toast.CENTER,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 矩形裁剪
class _RectClipper extends CustomClipper<Rect> {
  @override
  getClip(Size size) {
    return Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: 150,
      height: 150,
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

/// 圆角矩形裁剪
class _RRectClipper extends CustomClipper<RRect> {
  @override
  RRect getClip(Size size) {
    Rect r = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: 150,
      height: 150,
    );
    return RRect.fromRectAndRadius(
      r,
      Radius.circular(20),
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<RRect> oldClipper) {
    return true;
  }
}

/// 椭圆裁剪
class _OvalClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: 300,
      height: 200,
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}

/// Path剪裁
class _PathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width / 2 - size.height / 2, size.height)
      ..lineTo(size.width / 2 + size.height / 2, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

/// Path剪裁
class _HeartClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(size.width / 2 + 30, size.height / 7)
      ..relativeCubicTo(
        -100,
        -100,
        -200,
        70,
        0,
        180,
      )
      ..moveTo(size.width / 2 + 30, size.height / 7)
      ..relativeCubicTo(
        100,
        -100,
        200,
        70,
        0,
        180,
      );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
