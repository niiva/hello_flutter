import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class DecoratedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DecoratedBox Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: 'DecoratedBox',
            subTitles: [
              '给子元素加样式',
              '   这里加了颜色、圆角、阴影',
              '跟Container的decoration差不多',
            ],
            child: Center(
              child: DecoratedBox(
                child: Container(
                  width: 100,
                  height: 100,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(10, 10),
                      blurRadius: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
