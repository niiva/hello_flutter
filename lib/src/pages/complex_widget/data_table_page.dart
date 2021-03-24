import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';

class DataTablePage extends StatefulWidget {
  @override
  _DataTablePageState createState() => _DataTablePageState();
}

class _DataTablePageState extends State<DataTablePage> {
  bool _sortAscending;
  int _sortColumnIndex;
  List<DataColumn> _columnList;
  List<Map> _rowDataList;

  @override
  void initState() {
    super.initState();
    _sortAscending = true;

    // 列
    DataColumn dc1 = DataColumn(
      label: Text('姓名'),
      onSort: _sort,
    );
    DataColumn dc2 = DataColumn(
      label: Text('性别'),
      onSort: _sort,
    );
    DataColumn dc3 = DataColumn(
      label: Text('年龄'),
      onSort: _sort,
    );
    DataColumn dc4 = DataColumn(
      label: Text('毕业院校'),
      onSort: _sort,
    );
    _columnList = [dc1, dc2, dc3, dc4];

    // 行数据
    _rowDataList = [];
    for (var i = 0; i < 10; i++) {
      Map m = {
        'name': '张$i',
        'sex': i % 2 == 0 ? '男' : '女',
        'age': '${i + 20}',
        'school': '学校${20 - i}',
      };
      _rowDataList.add(m);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTable Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: DataTable(
                sortColumnIndex: _sortColumnIndex,
                sortAscending: _sortAscending,
                columns: _columnList,
                rows: _rowDataList.map((value) {
                  return DataRow(
                    cells: [
                      DataCell(Text('${value['name']}')),
                      DataCell(Text('${value['sex']}')),
                      DataCell(Text('${value['age']}')),
                      DataCell(Text('${value['school']}')),
                    ],
                  );
                }).toList(),
              ),
            ),
            DDDDescText(
              textList: [
                '简单的数据表格',
                '点击表头触发onSort方法排序',
                'sortColumnIndex排序列号(0开始)',
                'sortAscending(是否升序true/false)',
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _sort(int index, bool ascending) {
    setState(() {
      _sortColumnIndex = index;
      _sortAscending = ascending;

      _rowDataList.sort((a, b) {
        if (!ascending) {
          final c = a;
          a = b;
          b = c;
        }

        if (0 == index) {
          return a['name'].compareTo(b['name']);
        } else if (1 == index) {
          return a['sex'].compareTo(b['sex']);
        } else if (2 == index) {
          return a['age'].compareTo(b['age']);
        } else {
          return a['school'].compareTo(b['school']);
        }
      });
    });
  }
}
