import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class StreamBuilderPage extends StatefulWidget {
  @override
  _StreamBuilderPageState createState() => _StreamBuilderPageState();
}

class _StreamBuilderPageState extends State<StreamBuilderPage> {
  bool _switchValue;
  Stream _stream;

  @override
  void initState() {
    super.initState();
    _switchValue = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamBuilder Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: 'StreamBuilder',
            subTitles: [
              'initialData:snap初始数据',
              'stream:stream方法',
              'builder:组件',
              '根据AsyncSnapshot的状态返回响应的组件',
              '   none:初始状态',
              '   waiting:active状态前的等待',
              '   done:执行完毕',
              '   active:stream的持续返回',
              'snap.hasData判断是否成功返回数据',
              'snap.hasError判断是否发生错误',
            ],
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StreamBuilder(
                    initialData: 'initialData',
                    stream: _stream,
                    builder: (context, snap) {
                      if (ConnectionState.none == snap.connectionState) {
                        return Text('${snap.data}');
                      } else if (ConnectionState.waiting ==
                          snap.connectionState) {
                        return CircularProgressIndicator();
                      } else if (ConnectionState.active ==
                          snap.connectionState) {
                        if (snap.hasData) {
                          return Text(
                            '${snap.data}',
                            style: TextStyle(
                              color: Colors.orange,
                            ),
                          );
                        } else if (snap.hasError) {
                          return Text(
                            '${snap.error}',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          );
                        }
                      } else if (ConnectionState.done == snap.connectionState) {
                        if (snap.hasData) {
                          return Text(
                            '${snap.data}',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          );
                        } else if (snap.hasError) {
                          return Text(
                            '${snap.error}',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          );
                        }
                      }
                      return Container();
                    },
                  ),
                  Switch(
                    value: _switchValue,
                    onChanged: (value) {
                      _switchValue = value;
                      if (true == value) {
                        _stream = _streamData();
                      } else {
                        _stream = Stream.error('cancel');
                      }
                      this.setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // stream
  _streamData() {
    return Stream.fromFutures([
      Future.delayed(
        Duration(seconds: 1),
        () {
          return ('第一步');
        },
      ),
      Future.delayed(
        Duration(seconds: 2),
        () {
          return '第二步';
        },
      ),
      Future.delayed(
        Duration(seconds: 3),
        () {
          return Future.error('第三步发生错误');
        },
      ),
      Future.delayed(
        Duration(seconds: 4),
        () {
          setState(() {
            _switchValue = false;
          });
          return '第四步';
        },
      ),
    ]);
  }
}
