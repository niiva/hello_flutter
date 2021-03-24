import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class LimitedBoxPage extends StatefulWidget {
  @override
  _LimitedBoxPageState createState() => _LimitedBoxPageState();
}

class _LimitedBoxPageState extends State<LimitedBoxPage> {
  bool _switchValue;

  @override
  void initState() {
    super.initState();
    _switchValue = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LimitedBox Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: 'LimitedBox',
            subTitles: [
              'LimitedBox有两个限制:',
              '   maxWidth和maxHeight',
              '   如果不做限制, 其值为double.infinity',
              '',
              '!!!重要的一点!!!',
              'LimitedBox外层要加UnconstrainedBox',
              'LimitedBox只有在自身不受约束时才能限制其child',
            ],
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.yellow,
                  child: UnconstrainedBox(
                    child: LimitedBox(
                      maxWidth: _switchValue ? 50 : double.infinity,
                      child: Container(
                        color: Colors.green,
                        child: Text(
                          'abcdefghijklmnopqrstuvwxyz',
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('maxWidth:50'),
                    Switch(
                      value: _switchValue,
                      onChanged: (value) {
                        setState(() {
                          _switchValue = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
