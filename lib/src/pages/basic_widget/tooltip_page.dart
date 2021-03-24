import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class TooltipPage extends StatefulWidget {
  @override
  _TooltipPageState createState() => _TooltipPageState();
}

class _TooltipPageState extends State<TooltipPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tooltip Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: 'Icon',
            subTitles: [
              '万物皆可加Tooltip',
              'Tooltip(',
              '    message: \'这是一个Icon\'',
              '    child:Icon...'
            ],
            child: Wrap(
              spacing: 20,
              children: [
                Tooltip(
                  message: '这是一个Icon',
                  child: Icon(
                    Icons.ac_unit,
                    size: 60,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          DDDCard(
            title: 'Text',
            subTitles: [
              '万物皆可加Tooltip',
              'Tooltip(',
              '    message: \'这是一个Text\'',
              '    child:Text...',
            ],
            child: Tooltip(
              message: '这是一个Text',
              child: Text(
                '啊啊啊啊啊啊啊啊啊',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
