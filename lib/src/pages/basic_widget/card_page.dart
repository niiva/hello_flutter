import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Card Page',
        ),
      ),
      body: Column(
        children: [
          DDDCard(
            title: '自定义的Card',
            subTitles: [
              '通过margin设置外边距',
              '通过color设置背景色',
              '通过shadowColor设置阴影颜色',
              '通过elevation设置引用范围',
              '通过shape: RoundedRectangleBorder设置圆角',
            ],
            child: Container(
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
