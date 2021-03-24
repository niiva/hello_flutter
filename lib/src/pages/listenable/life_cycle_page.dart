import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';

class LifeCyclePage extends StatefulWidget {
  @override
  _LifeCyclePageState createState() => _LifeCyclePageState();
}

class _LifeCyclePageState extends State<LifeCyclePage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        print('后台回到前台');
        break;
      case AppLifecycleState.inactive:
        print('被打断、切换应用等状态触发');
        break;
      case AppLifecycleState.paused:
        print('进入后台');
        break;
      case AppLifecycleState.detached:
        print('应用程序仍然在Flutter引擎上运行, 但是与宿主View组件分离');
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LifeCycle Page'),
      ),
      body: Center(
        child: DDDDescText(
          textList: [
            'Flutter App生命周期:',
            'inactive被打断、切换应用等状态触发',
            'paused进入后台',
            'resumed应用回到前台(从inactive/paused回来)',
            'detached没太懂, 官方的解释是:'
                '「应用程序仍然在Flutter引擎上运行, 但是与宿主View组件分离」',
            '',
            '',
            '',
            '要监听app的生命周期, 需要',
            '1.(StatefulWidget)with WidgetsBindingObserver',
            '2.initState里WidgetsBinding.instance.addObserver(this);',
            '3.@override didChangeAppLifecycleState中判断state',
            '4.dispose时WidgetsBinding.instance.removeObserver(this);'
          ],
        ),
      ),
    );
  }
}
