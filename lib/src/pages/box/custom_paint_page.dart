import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class CustomPaintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomPaint Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: 'Canvas绘制「线」',
            subTitles: [
              '绘制:canvas.drawLine',
              '宽度:painter.strokeWidth',
              '   红色设置了4',
              '颜色:painter.color',
            ],
            child: CustomPaint(
              painter: _PaintLine(),
              size: Size(
                MediaQuery.of(context).size.width,
                30,
              ),
            ),
          ),
          DDDCard(
            title: 'Canvas绘制「点」',
            subTitles: [
              '绘制:canvas.drawPoints',
              '宽度:painter.strokeWidth',
              '   这里为了能看清楚,设置了4',
              '默认方形, 设置圆形用:',
              '   painter.strokeCap = StrokeCap.round',
            ],
            child: CustomPaint(
              painter: _PaintPoint(strokeWidth: 4),
              size: Size(
                MediaQuery.of(context).size.width,
                30,
              ),
            ),
          ),
          DDDCard(
            title: 'Canvas绘制「路线」',
            subTitles: [
              '绘制:canvas.drawPoints',
              '把上面的点连起来:',
              '   paintModel=PointMode.polygon',
            ],
            child: CustomPaint(
              painter: _PaintPoint(
                pointModel: ui.PointMode.polygon,
              ),
              size: Size(
                MediaQuery.of(context).size.width,
                30,
              ),
            ),
          ),
          DDDCard(
            title: 'Canvas绘制「圆形」',
            subTitles: [
              '绘制:canvas.drawCircle',
              '黑色:',
              '   painter默认参数',
              '红色:',
              '   painter.color = Colors.red',
              '   painter.style = PaintingStyle.stroke',
              '蓝色:',
              '   painter.color = Colors.blue',
              '   painter.style = PaintingStyle.stroke',
              '   painter.strokeWidth = 5',
            ],
            child: CustomPaint(
              painter: _PaintCircle(),
              size: Size(
                MediaQuery.of(context).size.width,
                100,
              ),
            ),
          ),
          DDDCard(
            title: 'Canvas绘制「矩形」',
            subTitles: [
              '绘制:canvas.drawRect',
              '黑色:',
              '   painter默认参数',
              '红色:',
              '   painter.color = Colors.red',
              '   painter.style = PaintingStyle.stroke',
              '紫色:',
              '   painter.color = Colors.purple',
              '   painter.style = PaintingStyle.stroke',
              '   painter.strokeWidth = 5',
            ],
            child: CustomPaint(
              painter: _PaintRect(),
              size: Size(
                MediaQuery.of(context).size.width,
                100,
              ),
            ),
          ),
          DDDCard(
            title: 'Canvas绘制「圆角矩形」',
            subTitles: [
              '绘制:canvas.drawRRect',
              '黑色:',
              '   painter默认参数',
              '红色:',
              '   painter.color = Colors.red',
              '   painter.style = PaintingStyle.stroke',
              '紫色:',
              '   painter.color = Colors.purple',
              '   painter.style = PaintingStyle.stroke',
              '   painter.strokeWidth = 5',
            ],
            child: CustomPaint(
              painter: _PaintRRect(),
              size: Size(
                MediaQuery.of(context).size.width,
                100,
              ),
            ),
          ),
          DDDCard(
            title: 'Canvas绘制「双圆角矩形」',
            subTitles: [
              '绘制:canvas.drawDRRect',
              '黑色:',
              '   painter默认参数',
              '   内外矩形的圆角半径与自身半径等长',
              '   就产生了「圆环」的效果',
              '红色:',
              '   painter.color = Colors.red',
              '   painter.style = PaintingStyle.stroke',
              '紫色:',
              '   painter.color = Colors.purple',
              '   painter.style = PaintingStyle.stroke',
              '   painter.strokeWidth = 5',
              '   内外矩形的圆角半径设置为0',
              '   就产生了「内外矩形」的效果',
            ],
            child: CustomPaint(
              painter: _PaintDRRect(),
              size: Size(
                MediaQuery.of(context).size.width,
                100,
              ),
            ),
          ),
          DDDCard(
            title: 'Canvas绘制「椭圆」',
            subTitles: [
              '绘制:canvas.drawOval',
              '黑色:',
              '   painter默认参数',
              '   限制rect宽高相等, 就成了「圆形」',
              '红色:',
              '   painter.color = Colors.red',
              '   painter.style = PaintingStyle.stroke',
              '绿色:',
              '   painter.color = Colors.green',
              '   painter.style = PaintingStyle.stroke',
              '   painter.strokeWidth = 5',
            ],
            child: CustomPaint(
              painter: _PaintOval(),
              size: Size(
                MediaQuery.of(context).size.width,
                100,
              ),
            ),
          ),
          DDDCard(
            title: 'Canvas绘制「弧形」',
            subTitles: [
              '参照上一条「椭圆」的位置去理解',
              '绘制:canvas.drawArc',
              '黑色:',
              '   painter默认参数',
              '红色:',
              '   painter.color = Colors.red',
              '   painter.style = PaintingStyle.stroke',
              '绿色:',
              '   painter.color = Colors.green',
              '   painter.style = PaintingStyle.stroke',
              '   painter.strokeWidth = 5',
              '   useCenter=true闭合中心点形成扇形',
              '另外, 角度<->弧度的公式:',
              '   弧度 = π / 180 * 角度',
              '   角度 = 弧度 * 180 / π'
            ],
            child: CustomPaint(
              painter: _PaintArc(),
              size: Size(
                MediaQuery.of(context).size.width,
                100,
              ),
            ),
          ),
          DDDCard(
            title: 'Canvas绘制「路径」',
            subTitles: [
              '绘制:canvas.drawPath',
              '   使用moveTo移动到「绝对位置」',
              '   使用relativeMoveTo移动到「相对位置」',
              '   使用lineTo连线「绝对位置」',
              '   使用relativeLineTo连线「相对位置」',
            ],
            child: CustomPaint(
              painter: _PaintPath(),
              size: Size(
                MediaQuery.of(context).size.width,
                100,
              ),
            ),
          ),
          DDDCard(
            title: 'Canvas绘制「贝塞尔曲线」',
            subTitles: [
              '绘制:canvas.drawPath',
              '蓝色:',
              '   path.arcTo做了个半圆',
              '红色:',
              '   path.cubicTo做三阶bezier曲线',
              '   paint.style = PaintingStyle.fill做填充',
            ],
            child: CustomPaint(
              painter: _PaintBezier(),
              size: Size(
                MediaQuery.of(context).size.width,
                100,
              ),
            ),
          ),
          DDDCard(
            title: 'Canvas绘制「图片」',
            subTitles: [
              '绘制:canvas.drawArc',
              '有一点需要注意:',
              '   参数中的Image是dart:ui中的Image',
              '   这里用Codec对asset图片进行了转换',
            ],
            child: CustomPaint(
              painter: _PaintImage(),
              size: Size(
                MediaQuery.of(context).size.width,
                100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 绘制直线
class _PaintLine extends CustomPainter {
  Paint _myPaint;

  @override
  void paint(Canvas canvas, Size size) {
    _myPaint = new Paint()
      ..color = Colors.blue
      ..strokeWidth = 1;

    Offset p1 = Offset(100, 0);
    Offset p2 = Offset(160, 10);
    Offset p3 = Offset(120, 20);
    Offset p4 = Offset(130, 30);
    Offset p5 = Offset(200, 0);
    Offset p6 = Offset(260, 10);

    canvas.drawLine(
      p1,
      p2,
      _myPaint,
    );

    canvas.drawLine(
      p3,
      p4,
      _myPaint..color = Colors.black,
    );

    canvas.drawLine(
      p5,
      p6,
      _myPaint
        ..color = Colors.red
        ..strokeWidth = 4,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

/// 绘制点
class _PaintPoint extends CustomPainter {
  Paint _myPaint;
  ui.PointMode pointModel;
  double strokeWidth;

  _PaintPoint({
    this.pointModel = ui.PointMode.points,
    this.strokeWidth = 1,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _myPaint = new Paint()..color = Colors.black;

    Offset p1 = Offset(100, 0);
    Offset p2 = Offset(160, 10);
    Offset p3 = Offset(120, 20);
    Offset p4 = Offset(130, 30);
    Offset p5 = Offset(200, 0);
    Offset p6 = Offset(260, 10);
    Offset p7 = Offset(220, 20);
    Offset p8 = Offset(230, 30);

    canvas.drawPoints(
      pointModel,
      [p1, p2, p3, p4, p5, p6, p7, p8],
      _myPaint..strokeWidth = strokeWidth,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

/// 绘制圆
class _PaintCircle extends CustomPainter {
  Paint _myPaint;

  @override
  void paint(Canvas canvas, Size size) {
    _myPaint = new Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    Offset c1 = Offset(50, 50);
    Offset c2 = Offset(150, 50);
    Offset c3 = Offset(250, 50);

    canvas.drawCircle(
      c1,
      40,
      _myPaint,
    );

    canvas.drawCircle(
      c2,
      40,
      _myPaint
        ..color = Colors.red
        ..style = PaintingStyle.stroke,
    );

    canvas.drawCircle(
      c3,
      40,
      _myPaint
        ..color = Colors.blue
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

/// 绘制矩形
class _PaintRect extends CustomPainter {
  Paint _myPaint;

  @override
  void paint(Canvas canvas, Size size) {
    _myPaint = new Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    // Rect初始化方法fromCircle
    Rect r1 = Rect.fromCircle(
      center: Offset(50, 50),
      radius: 50,
    );

    // Rect初始化方法fromLTWH
    Rect r2 = Rect.fromLTWH(
      110,
      0,
      120,
      80,
    );

    // Rect初始化方法fromPoints
    Rect r3 = Rect.fromPoints(
      Offset(240, 0),
      Offset(300, 90),
    );

    canvas.drawRect(
      r1,
      _myPaint,
    );

    canvas.drawRect(
      r2,
      _myPaint
        ..color = Colors.red
        ..style = PaintingStyle.stroke,
    );

    canvas.drawRect(
      r3,
      _myPaint
        ..color = Colors.purple
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

/// 绘制圆角矩形
class _PaintRRect extends CustomPainter {
  Paint _myPaint;

  @override
  void paint(Canvas canvas, Size size) {
    _myPaint = new Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    // Rect初始化方法fromCircle
    Rect r1 = Rect.fromCircle(
      center: Offset(50, 50),
      radius: 50,
    );
    RRect rr1 = RRect.fromRectAndRadius(
      r1,
      Radius.circular(10),
    );

    // Rect初始化方法fromLTWH
    Rect r2 = Rect.fromLTWH(
      110,
      0,
      120,
      80,
    );
    RRect rr2 = RRect.fromRectAndRadius(
      r2,
      Radius.circular(10),
    );

    // Rect初始化方法fromPoints
    Rect r3 = Rect.fromPoints(
      Offset(240, 0),
      Offset(300, 90),
    );
    RRect rr3 = RRect.fromRectAndRadius(
      r3,
      Radius.circular(10),
    );

    canvas.drawRRect(
      rr1,
      _myPaint,
    );

    canvas.drawRRect(
      rr2,
      _myPaint
        ..color = Colors.red
        ..style = PaintingStyle.stroke,
    );

    canvas.drawRRect(
      rr3,
      _myPaint
        ..color = Colors.purple
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

/// 绘制双圆角矩形
class _PaintDRRect extends CustomPainter {
  Paint _myPaint;

  @override
  void paint(Canvas canvas, Size size) {
    _myPaint = new Paint();

    // Rect初始化方法fromCircle
    Rect ri1 = Rect.fromCircle(
      center: Offset(50, 50),
      radius: 40,
    );
    Rect ro1 = Rect.fromCircle(
      center: Offset(50, 50),
      radius: 50,
    );
    RRect rri1 = RRect.fromRectAndRadius(
      ri1,
      Radius.circular(40),
    );
    RRect rro1 = RRect.fromRectAndRadius(
      ro1,
      Radius.circular(50),
    );

    // Rect初始化方法fromLTWH
    Rect ri2 = Rect.fromLTWH(
      115,
      5,
      110,
      70,
    );
    Rect ro2 = Rect.fromLTWH(
      110,
      0,
      120,
      80,
    );
    RRect rri2 = RRect.fromRectAndRadius(
      ri2,
      Radius.circular(10),
    );
    RRect rro2 = RRect.fromRectAndRadius(
      ro2,
      Radius.circular(10),
    );

    // Rect初始化方法fromPoints
    Rect ri3 = Rect.fromPoints(
      Offset(250, 10),
      Offset(290, 80),
    );
    Rect ro3 = Rect.fromPoints(
      Offset(240, 0),
      Offset(300, 90),
    );
    RRect rri3 = RRect.fromRectAndRadius(
      ri3,
      Radius.circular(0),
    );
    RRect rro3 = RRect.fromRectAndRadius(
      ro3,
      Radius.circular(0),
    );

    canvas.drawDRRect(
      rro1,
      rri1,
      _myPaint,
    );

    canvas.drawDRRect(
      rro2,
      rri2,
      _myPaint
        ..color = Colors.red
        ..style = PaintingStyle.stroke,
    );

    canvas.drawDRRect(
      rro3,
      rri3,
      _myPaint
        ..color = Colors.purple
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

/// 绘制椭圆
class _PaintOval extends CustomPainter {
  Paint _myPaint;

  @override
  void paint(Canvas canvas, Size size) {
    _myPaint = new Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    // Rect初始化方法fromCircle
    Rect r1 = Rect.fromCircle(
      center: Offset(50, 50),
      radius: 50,
    );

    // Rect初始化方法fromLTWH
    Rect r2 = Rect.fromLTWH(
      110,
      0,
      120,
      80,
    );

    // Rect初始化方法fromPoints
    Rect r3 = Rect.fromPoints(
      Offset(240, 0),
      Offset(300, 90),
    );

    canvas.drawOval(
      r1,
      _myPaint,
    );

    canvas.drawOval(
      r2,
      _myPaint
        ..color = Colors.red
        ..style = PaintingStyle.stroke,
    );

    canvas.drawOval(
      r3,
      _myPaint
        ..color = Colors.green
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

/// 绘制圆弧
class _PaintArc extends CustomPainter {
  Paint _myPaint;

  @override
  void paint(Canvas canvas, Size size) {
    _myPaint = new Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    // Rect初始化方法fromCircle
    Rect r1 = Rect.fromCircle(
      center: Offset(50, 50),
      radius: 50,
    );

    // Rect初始化方法fromLTWH
    Rect r2 = Rect.fromLTWH(
      110,
      0,
      120,
      80,
    );

    // Rect初始化方法fromPoints
    Rect r3 = Rect.fromPoints(
      Offset(240, 0),
      Offset(300, 90),
    );

    canvas.drawArc(
      r1,
      0,
      pi / 180 * 90,
      false,
      _myPaint,
    );

    canvas.drawArc(
      r2,
      0,
      pi / 180 * 90,
      false,
      _myPaint
        ..color = Colors.red
        ..style = PaintingStyle.stroke,
    );

    canvas.drawArc(
      r3,
      0,
      pi / 180 * 90,
      true,
      _myPaint
        ..color = Colors.green
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

/// 绘制路径
class _PaintPath extends CustomPainter {
  Paint _myPaint;

  @override
  void paint(Canvas canvas, Size size) {
    _myPaint = new Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path = Path()
      ..moveTo(0, 100)
      ..relativeLineTo(30, -100)
      ..relativeLineTo(30, 100)
      ..relativeLineTo(30, -100)
      ..relativeLineTo(30, 100)
      ..relativeLineTo(-120, 0);

    canvas.drawPath(
      path,
      _myPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

/// 绘制路径
class _PaintBezier extends CustomPainter {
  Paint _myPaint;

  @override
  void paint(Canvas canvas, Size size) {
    _myPaint = new Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // 绘制一个D形
    Path path = Path()
      ..moveTo(0, 100)
      ..lineTo(0, 0)
      ..arcTo(
        Rect.fromCircle(
          center: Offset(
            0,
            50,
          ),
          radius: 50,
        ),
        -pi / 180 * 90,
        pi / 180 * 180,
        true,
      );

    // 绘制一个心形
    Path path2 = Path()
      ..moveTo(150, 30)
      ..relativeCubicTo(
        -40,
        -40,
        -80,
        25,
        0,
        70,
      )
      ..moveTo(150, 30)
      ..relativeCubicTo(
        40,
        -40,
        80,
        25,
        0,
        70,
      );

    canvas.drawPath(
      path,
      _myPaint,
    );

    canvas.drawPath(
      path2,
      _myPaint
        ..color = Colors.red
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

/// 绘制图片
class _PaintImage extends CustomPainter {
  Paint _myPaint;
  ui.Image _image;

  _PaintImage() {
    _loadImage('assets/images/xiaomao.jpg').then((res) {
      _image = res;
    });
  }

  /// 通过assets路径，获取资源图片
  Future<ui.Image> _loadImage(String asset) async {
    ByteData data = await rootBundle.load(asset);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }

  @override
  void paint(Canvas canvas, Size size) {
    _myPaint = new Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    canvas.drawImage(
      _image,
      Offset(0, 0),
      _myPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
