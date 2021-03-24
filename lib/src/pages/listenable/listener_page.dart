import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class ListenerPage extends StatefulWidget {
  @override
  _ListenerPageState createState() => _ListenerPageState();
}

class _ListenerPageState extends State<ListenerPage> {
  // Listener
  bool _lYellow;
  bool _lBlue;
  bool _lGreen;

  @override
  void initState() {
    super.initState();

    _lYellow = false;
    _lBlue = false;
    _lGreen = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listener Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: 'Listener',
            subTitles: [
              '个人理解, 比GestureDetector更纯粹',
              '   另外onPointerHover可以监听桌面应用鼠标的悬停',
              '',
              'hitTest:',
              'yellow${_lYellow ? '(√)' : '(×)'}',
              'blue${_lBlue ? '(√)' : '(×)'}',
              'green${_lGreen ? '(√)' : '(×)'}',
            ],
            child: Listener(
              onPointerDown: (e) {
                setState(() {
                  _lYellow = true;
                });
              },
              onPointerUp: (e) {
                setState(() {
                  _lYellow = false;
                });
              },
              child: Container(
                width: double.infinity,
                height: 300,
                color: Colors.yellow,
                alignment: Alignment.center,
                child: Listener(
                  onPointerDown: (e) {
                    setState(() {
                      _lBlue = true;
                    });
                  },
                  onPointerUp: (e) {
                    setState(() {
                      _lBlue = false;
                    });
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Listener(
                      onPointerDown: (e) {
                        setState(() {
                          _lGreen = true;
                        });
                      },
                      onPointerUp: (e) {
                        setState(() {
                          _lGreen = false;
                        });
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.green,
                        alignment: Alignment.center,
                      ),
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
