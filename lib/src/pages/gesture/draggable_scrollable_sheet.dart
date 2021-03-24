import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';

class DraggableScrollableSheetPage extends StatefulWidget {
  @override
  _DraggableScrollableSheetPageState createState() =>
      _DraggableScrollableSheetPageState();
}

class _DraggableScrollableSheetPageState
    extends State<DraggableScrollableSheetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DraggableScrollableSheet Page'),
      ),
      body: DraggableScrollableActuator(
        child: Builder(
          builder: (ctx) {
            return Column(
              children: [
                DDDCard(
                  title: 'DraggableScrollableActuator',
                  subTitles: [
                    'DraggableScrollableActuator可以让Sheet回到初始位置',
                    '   DraggableScrollableActuator.reset(ctx);',
                    '',
                    '需要注意的是ctx是Builder创建的参数'
                  ],
                  child: Container(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: Colors.green,
                      child: Text('Reset'),
                      onPressed: () {
                        DraggableScrollableActuator.reset(ctx);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: DraggableScrollableSheet(
                    initialChildSize: 0.4,
                    maxChildSize: 1.0,
                    minChildSize: 0.2,
                    builder: _draggableSS,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _draggableSS(BuildContext context, ScrollController scrollController) {
    return ListView.builder(
      controller: scrollController,
      itemCount: 20,
      itemBuilder: _itemBuilder,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return 0 == index
        ? Container(
            color: Colors.green,
            child: DDDDescText(
              textList: [
                'DraggableScrollableSheet可拖拽的BottomSheet',
                '   initialChildSize初始值0<~1.0',
                '   maxChildSize最大值0<~1.0',
                '   minChildSize最小值0<~1.0',
              ],
            ),
          )
        : Container(
            width: double.infinity,
            height: 80,
            color: Colors.green[100 * ((index % 8 + 1))],
            alignment: Alignment.centerLeft,
            child: Text('$index'),
          );
  }
}
