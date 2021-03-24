import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class ProgressIndicatorPage extends StatefulWidget {
  @override
  _ProgressIndicatorPageState createState() => _ProgressIndicatorPageState();
}

class _ProgressIndicatorPageState extends State<ProgressIndicatorPage> {
  double _circleProgress;
  double _linerProgress;

  Timer _t1;
  Timer _t2;

  @override
  void initState() {
    super.initState();
    _circleProgress = 0.0;
    _linerProgress = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ProgressIndicator Page',
        ),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: 'CircularProgressIndicator',
            subTitles: [
              '默认状态可以理解为一个一直在转的动画',
            ],
            child: Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          ),
          DDDCard(
            title: 'CircularProgressIndicator',
            subTitles: [
              'value设置当前进度',
              'backgroundColor设置圆环背景色',
              'valueColor进度颜色',
              'strokeWidth设置线条宽度',
            ],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.green),
                  strokeWidth: 7,
                  value: _circleProgress,
                ),
                IconButton(
                  onPressed: () {
                    _timer1Start();
                  },
                  icon: Icon(Icons.restore),
                ),
              ],
            ),
          ),
          DDDCard(
            title: 'LinearProgressIndicator',
            subTitles: [
              '默认状态可以理解为一个一直在线性增长的动画',
            ],
            child: LinearProgressIndicator(),
          ),
          DDDCard(
            title: 'LinearProgressIndicator',
            subTitles: [
              'value设置当前进度',
              'backgroundColor设置线条背景色',
              'valueColor进度颜色',
              'minHeight设置线条高度',
            ],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.green),
                  minHeight: 10,
                  value: _linerProgress,
                ),
                IconButton(
                  onPressed: () {
                    _timer2Start();
                  },
                  icon: Icon(Icons.restore),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 定时器开始
  void _timer1Start() {
    setState(() {
      _circleProgress = 0.0;
    });

    if (null != _t1 && _t1.isActive) {
      _t1.cancel();
    }

    _t1 = Timer.periodic(
      Duration(milliseconds: 100),
      (timer) {
        if (_circleProgress < 1.0) {
          setState(() {
            _circleProgress += 0.1;
          });
        } else {
          _timer1Stop();
        }
      },
    );
  }

  // 定时器停止
  void _timer1Stop() {
    _t1.cancel();
  }

  // 定时器开始
  void _timer2Start() {
    setState(() {
      _linerProgress = 0.0;
    });

    if (null != _t2 && _t2.isActive) {
      _t1.cancel();
    }

    _t2 = Timer.periodic(
      Duration(milliseconds: 100),
      (timer) {
        if (_linerProgress < 1.0) {
          setState(() {
            _linerProgress += 0.1;
          });
        } else {
          _timer2Stop();
        }
      },
    );
  }

  // 定时器停止
  void _timer2Stop() {
    _t2.cancel();
  }
}
