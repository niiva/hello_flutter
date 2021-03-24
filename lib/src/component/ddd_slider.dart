import 'package:flutter/material.dart';

class DDDSlider extends StatefulWidget {
  final EdgeInsets padding;
  final String title;
  final double defaultValue;
  final double max;
  final double min;
  final String label;
  final ValueChanged valueChanged;

  const DDDSlider({
    Key key,
    @required this.title,
    @required this.defaultValue,
    @required this.label,
    @required this.valueChanged,
    this.max = 1.0,
    this.min = 0.0,
    this.padding = EdgeInsets.zero,
  });

  @override
  _DDDSliderState createState() => _DDDSliderState();
}

class _DDDSliderState extends State<DDDSlider> {
  double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '    ${widget.title}:',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SliderTheme(
            data: SliderThemeData(
              showValueIndicator: ShowValueIndicator.always,
              valueIndicatorColor: Colors.green,
            ),
            child: Slider(
              value: _value,
              max: widget.max,
              min: widget.min,
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              label: widget.label,
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
                widget.valueChanged(_value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
