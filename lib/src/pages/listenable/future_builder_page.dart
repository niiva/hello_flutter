import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class FutureBuilderPage extends StatefulWidget {
  @override
  _FutureBuilderPageState createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  Future<String> _future;
  bool _switchValue;

  @override
  void initState() {
    super.initState();
    _switchValue = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilder Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: 'FutureBuilder',
            subTitles: [
              'initialData:snap初始数据',
              'future:future方法',
              'builder:组件',
              '根据AsyncSnapshot的状态返回响应的组件',
              '   none:初始状态',
              '   waiting:future执行过程',
              '   done:future执行完毕',
              'snap.hasData判断是否成功返回数据',
              'snap.hasError判断是否发生错误',
            ],
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FutureBuilder(
                    initialData: 'initialData',
                    future: _future,
                    builder: (context, snap) {
                      if (ConnectionState.none == snap.connectionState) {
                        return Text('${snap.data}');
                      } else if (ConnectionState.waiting ==
                          snap.connectionState) {
                        return CircularProgressIndicator();
                      } else if (ConnectionState.done == snap.connectionState) {
                        if (snap.hasData) {
                          return Text('${snap.data}');
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
                        _future = _loadData();
                      } else {
                        _future = Future.error('cancel');
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

  // future
  Future<String> _loadData() async {
    await Future.delayed(
      Duration(seconds: 3),
    );

    setState(() {
      _switchValue = false;
    });

    return 'LoadSucceed';
  }
}
