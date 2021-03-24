import 'package:flutter/material.dart';

class DDDRowRadio extends StatefulWidget {
  final double paddingTop; // padding top
  final String title; // 标题
  final String leftTitle; // 左边标题
  final String rightTitle; // 右边标题
  final VoidCallback leftClicked; // 回调方法 左边radio
  final VoidCallback rightClicked; // 回调方法 右边radio
  final bool value; // setValue

  const DDDRowRadio({
    Key key,
    @required this.title,
    @required this.leftTitle,
    @required this.rightTitle,
    @required this.leftClicked,
    @required this.rightClicked,
    this.paddingTop = 20.0,
    this.value = true,
  });

  @override
  _DDDRowRadioState createState() => _DDDRowRadioState();
}

class _DDDRowRadioState extends State<DDDRowRadio> {
  bool _groupValue;

  @override
  void initState() {
    super.initState();
    _groupValue = null != widget.value ? widget.value : true;
  }

  @override
  void didUpdateWidget(covariant DDDRowRadio oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (null != widget.value && widget.value != oldWidget.value) {
      setState(() {
        _groupValue = widget.value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: widget.paddingTop,
      ),
      child: Row(
        children: [
          Text(
            '${widget.title}:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10,
            ),
            child: Row(
              children: [
                Text(
                  '${widget.leftTitle}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Radio(
                    value: true,
                    groupValue: _groupValue,
                    onChanged: (value) {
                      setState(() {
                        _groupValue = value;
                      });
                      widget.leftClicked();
                    }),
                Text(
                  '${widget.rightTitle}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Radio(
                    value: false,
                    groupValue: _groupValue,
                    onChanged: (value) {
                      setState(() {
                        _groupValue = value;
                      });
                      widget.rightClicked();
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
