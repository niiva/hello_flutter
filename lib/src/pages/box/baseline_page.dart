import 'package:flutter/material.dart';

class BaselinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Baseline Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '利用横向布局交叉轴end属性:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.lightGreen,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Text1',
                style: TextStyle(
                  fontSize: 50,
                  backgroundColor: Colors.yellow,
                ),
              ),
              Text(
                'Text2',
                style: TextStyle(
                  fontSize: 25,
                  backgroundColor: Colors.yellow,
                ),
              ),
              Text(
                'Text3',
                style: TextStyle(
                  fontSize: 40,
                  backgroundColor: Colors.yellow,
                ),
              ),
            ],
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          Text(
            '利用基准线:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.lightGreen,
            ),
          ),
          Row(
            children: [
              this._rowBaseLine(
                Text(
                  'Text1',
                  style: TextStyle(
                    fontSize: 50,
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ),
              this._rowBaseLine(
                Text(
                  'Text2',
                  style: TextStyle(
                    fontSize: 25,
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ),
              this._rowBaseLine(
                Text(
                  'Text3',
                  style: TextStyle(
                    fontSize: 40,
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          Text(
            '利用富文本:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.lightGreen,
            ),
          ),
          Row(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Text1',
                      style: TextStyle(
                        fontSize: 50,
                        backgroundColor: Colors.yellow,
                      ),
                    ),
                    TextSpan(
                      text: 'Text2',
                      style: TextStyle(
                        fontSize: 25,
                        backgroundColor: Colors.yellow,
                      ),
                    ),
                    TextSpan(
                      text: 'Text3',
                      style: TextStyle(
                        fontSize: 40,
                        backgroundColor: Colors.yellow,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          Text(
            '对于文本排列, 效果支持最好的还是富文本, Baseline使用的条件过于苛刻, 没什么大用.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Baseline _rowBaseLine(Widget widget) {
    return Baseline(
      baseline: 50,
      baselineType: TextBaseline.ideographic,
      child: widget,
    );
  }
}
