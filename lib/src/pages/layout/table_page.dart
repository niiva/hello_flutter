import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_row_add_remove.dart';

class TablePage extends StatefulWidget {
  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  int _row;
  int _column;

  @override
  void initState() {
    super.initState();
    _row = 3;
    _column = 3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Page'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Table(
                border: TableBorder.all(),
                children: this._tableChildren(),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                DDDRowAddRemove(
                  title: '列数',
                  defaultValue: 3,
                  stepValue: 1,
                  maxValue: 7,
                  minValue: 0,
                  valueChanged: (value) {
                    setState(() {
                      _column = value.round();
                    });
                  },
                ),
                DDDRowAddRemove(
                  title: '行数',
                  defaultValue: 3,
                  stepValue: 1,
                  maxValue: 10,
                  minValue: 0,
                  valueChanged: (value) {
                    setState(() {
                      _row = value.round();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<TableRow> _tableChildren() {
    List<TableRow> rList = [
      TableRow(
        children: [
          Text(
            '***',
          ),
        ],
      ),
    ];

    for (int r = 0; r < _row; r++) {
      TableRow tr = TableRow(
        children: [
          Text(
            'R${r + 1}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
      rList.add(tr);
    }

    for (int c = 0; c < _column; c++) {
      for (int i = 0; i < rList.length; i++) {
        TableRow tr = rList[i];
        tr.children.add(
          Text(
            (i > 0 ? 'R${i + 1}' : '') + 'C${c + 1}',
            style: TextStyle(
              fontWeight: 0 == i ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        );
      }
    }

    return rList;
  }
}
