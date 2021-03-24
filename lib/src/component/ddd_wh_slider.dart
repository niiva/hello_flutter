import 'package:flutter/material.dart';

class DDDWHSlider extends StatefulWidget {
  final double hDefaultValue;
  final double hMax;
  final double hMin;
  final String hLabel;
  final ValueChanged hValueChanged;

  final double vDefaultValue;
  final double vMax;
  final double vMin;
  final String vLabel;
  final ValueChanged vValueChanged;

  final String text;

  DDDWHSlider({
    Key key,
    @required this.hDefaultValue,
    @required this.hLabel,
    @required this.hValueChanged,
    @required this.vDefaultValue,
    @required this.vLabel,
    @required this.vValueChanged,
    @required this.text,
    this.hMax = 1.0,
    this.hMin = 0.0,
    this.vMax = 1.0,
    this.vMin = 0.0,
  });

  @override
  _DDDWHSliderState createState() => _DDDWHSliderState();
}

class _DDDWHSliderState extends State<DDDWHSlider> {
  double _hValue;
  double _vValue;

  @override
  void initState() {
    super.initState();
    _hValue = widget.hDefaultValue;
    _vValue = widget.vDefaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 260,
          height: 50,
          child: SliderTheme(
            data: SliderThemeData(
              showValueIndicator: ShowValueIndicator.always,
              valueIndicatorColor: Colors.green,
            ),
            child: Slider(
              value: _hValue,
              max: widget.hMax,
              min: widget.hMin,
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              label: widget.hLabel,
              onChanged: (value) {
                setState(() {
                  _hValue = value;
                });
                widget.hValueChanged(value);
              },
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 260,
          child: Row(
            children: [
              SizedBox(
                width: 30,
              ),
              RotatedBox(
                quarterTurns: 1,
                child: Container(
                  width: 260,
                  height: 50,
                  child: SliderTheme(
                    data: SliderThemeData(
                      showValueIndicator: ShowValueIndicator.always,
                      valueIndicatorColor: Colors.green,
                    ),
                    child: Slider(
                      value: _vValue,
                      max: 100.0,
                      min: 1.0,
                      activeColor: Colors.green,
                      inactiveColor: Colors.grey,
                      label: widget.vLabel,
                      onChanged: (value) {
                        setState(() {
                          _vValue = value;
                        });
                        widget.vValueChanged(value);
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                '${widget.text}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
