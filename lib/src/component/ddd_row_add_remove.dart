import 'package:flutter/material.dart';

class DDDRowAddRemove extends StatefulWidget {
  final double paddingTop;
  final String title;
  final num defaultValue; // 默认值
  final num stepValue; // 每次点击增减值
  final num maxValue; // 最大值(超过此值+按钮不能点击)
  final num minValue; // 最小值(低于此值-按钮不能点击)
  final ValueChanged valueChanged; // 值改变回调方法

  const DDDRowAddRemove({
    Key key,
    @required this.title,
    @required this.defaultValue,
    @required this.stepValue,
    @required this.maxValue,
    @required this.minValue,
    @required this.valueChanged,
    this.paddingTop = 20.0,
  });

  @override
  _DDDRowAddRemoveState createState() => _DDDRowAddRemoveState();
}

class _DDDRowAddRemoveState extends State<DDDRowAddRemove> {
  num _value;

  @override
  void initState() {
    super.initState();
    _value = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: widget.paddingTop,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MaterialButton(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            color: Colors.orange,
            disabledColor: Colors.grey,
            onPressed: _value < widget.maxValue
                ? () {
                    setState(() {
                      _value += widget.stepValue;
                    });
                    widget.valueChanged(_value);
                  }
                : null,
          ),
          Text(
            '${widget.title}($_value)',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          MaterialButton(
            child: Icon(
              Icons.remove,
              color: Colors.white,
            ),
            color: Colors.orange,
            disabledColor: Colors.grey,
            onPressed: _value > widget.minValue
                ? () {
                    setState(() {
                      _value -= widget.stepValue;
                    });
                    widget.valueChanged(_value);
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
