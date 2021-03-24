import 'package:flutter/material.dart';

class DDDDescText extends StatelessWidget {
  final double paddingTop;
  final List<String> textList;

  const DDDDescText({
    Key key,
    @required this.textList,
    this.paddingTop = 20.0,
  }) : assert(
          textList != null && textList.length > 0,
          'DDDDescText:列表不能为空',
        );

  @override
  Widget build(BuildContext context) {
    String text = '*' + this.textList[0];
    for (var i = 1; i < this.textList.length; i++) {
      text = text + '\n' + '*' + this.textList[i];
    }

    return Padding(
      padding: EdgeInsets.only(
        top: this.paddingTop,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
