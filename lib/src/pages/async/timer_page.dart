import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int _num;
  bool _switchOn;
  Timer _t;

  @override
  void initState() {
    super.initState();
    _num = 10;
    _switchOn = false;
  }

  @override
  void dispose() {
    super.dispose();
    _timerStop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer Page'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              alignment: Alignment.center,
              child: Text(
                '$_num',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              child: DDDCard(
                title: 'Timer',
                subTitles: [
                  '默认构造函数:只执行一次',
                  'Timer.periodic构造函数重复执行, Duration指定间隔',
                  'cancel()停止',
                ],
                child: Center(
                  child: Transform.scale(
                    scale: 1.8,
                    child: Switch(
                      value: _switchOn,
                      activeColor: Colors.green,
                      onChanged: (value) {
                        _switchTapped(value);
                      },
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

  // switch状态切换
  void _switchTapped(bool value) {
    if (value) {
      _timerStart();
    } else {
      _timerStop();
    }

    setState(() {
      _switchOn = value;
    });
  }

  // 定时器开始
  void _timerStart() {
    _t = Timer.periodic(
      Duration(milliseconds: 1000),
      (timer) {
        if (_num > 0) {
          setState(() {
            _num--;
          });
        } else {
          _timerStop();
          setState(() {
            _switchOn = false;
            _num = 10;
          });
        }
      },
    );
  }

  // 定时器停止
  void _timerStop() {
    _t.cancel();
  }
}
