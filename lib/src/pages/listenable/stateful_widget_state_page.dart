import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class StatefulWidgetStatePage extends StatefulWidget {
  @override
  _StatefulWidgetStatePageState createState() =>
      _StatefulWidgetStatePageState();
}

class _StatefulWidgetStatePageState extends State<StatefulWidgetStatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatefulWidgetState Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DDDCard(
              title: 'createState',
              subTitles: [
                'StatefulWidget里创建State的方法',
                '当要创建新的StatefulWidget的时候',
                '会立即执行createState, 而且只执行一次',
              ],
              child: Container(),
            ),
            DDDCard(
              title: 'initState',
              subTitles: [
                'StatefulWidget创建完后调用的第一个方法',
                '而且只执行一次',
                '在这里View并没有渲染',
                '但是这时StatefulWidget已经被加载到渲染树里了',
                '这时StatefulWidget的mount的值会变为true',
                '直到dispose调用的时候才会变为false',
                '',
                'initState里一般会做一些初始化的操作',
                '   如初始化state值、addListener等'
              ],
              child: Container(),
            ),
            DDDCard(
              title: 'didChangeDependencies',
              subTitles: [
                '会在initState方法之后立即调用',
                '之后当StatefulWidget刷新的时候, 就不会调用了',
                '如果StatefulWidget依赖的InheritedWidget发生变化',
                'didChangeDependencies会被再次调用',
                '所以didChangeDependencies有可能会被调用多次',
              ],
              child: Container(),
            ),
            DDDCard(
              title: 'build',
              subTitles: [
                '在StatefulWidget第一次创建的时候',
                'build方法会在didChangeDependencies方法之后立即调用',
                '每当UI需要重新渲染的时候(setState触发), build都会被调用',
                '所以build会被多次调用, 然后返回要渲染的Widget',
                '',
                'build里除了创建Widget之外的操作一般不做其他事情',
                '因为那样会影响 UI 的渲染效率',
              ],
              child: Container(),
            ),
            DDDCard(
              title: 'addPostFrameCallback',
              subTitles: [
                'StatefulWidge渲染结束的回调',
                '只会被调用一次',
                '之后StatefulWidget需要刷新UI也不会被调用',
                '',
                'addPostFrameCallback的使用方法是在initState里添加回调:',
                '   SchedulerBinding.instance.addPostFrameCallback((_) => {});'
              ],
              child: Container(),
            ),
            DDDCard(
              title: 'didUpdateWidget',
              subTitles: [
                '祖先节点rebuild widget时调用',
                '当组件的状态改变的时候就会调用didUpdateWidget',
                '可能会调用多次',
                '',
                '注意:',
                '   涉及到controller的变更',
                '   需要在这个函数中移除老的controller的监听',
                '   并创建新controller的监听',
              ],
              child: Container(),
            ),
            DDDCard(
              title: 'deactivate',
              subTitles: [
                '当要将State对象从渲染树中移除的时候',
                '就会调用deactivate生命周期',
                '这标志着StatefulWidget将要销毁',
                '',
                '但是:',
                '   有时候State不会被销毁',
                '   而是重新插入到渲染树种',
                '所以这里不能确定, 只是一个「预销毁」状态',
              ],
              child: Container(),
            ),
            DDDCard(
              title: 'dispose',
              subTitles: [
                '当View不需要再显示, 从渲染树中移除的时候',
                'State就会永久的从渲染树中移除, 就会调用dispose生命周期',
                '',
                'dispose里一般做一些取消监听、停止动画等操作',
              ],
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
