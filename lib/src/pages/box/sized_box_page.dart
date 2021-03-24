import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class SizedBoxPage extends StatefulWidget {
  @override
  _SizedBoxPageState createState() => _SizedBoxPageState();
}

class _SizedBoxPageState extends State<SizedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SizedBox Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: 'SizeBox',
            subTitles: [
              '在红蓝色块中间加了一个SizeBox(height:20)',
            ],
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
