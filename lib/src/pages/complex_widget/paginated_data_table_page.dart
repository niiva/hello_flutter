import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';

class PaginatedDataTablePage extends StatefulWidget {
  @override
  _PaginatedDataTablePageState createState() => _PaginatedDataTablePageState();
}

class _PaginatedDataTablePageState extends State<PaginatedDataTablePage> {
  bool _sortAscending;
  int _sortColumnIndex;
  int _rowsPerPage;
  List<DataColumn> _columnList;
  PaginatedDataTableSource _pdtSource;

  @override
  void initState() {
    super.initState();
    _sortAscending = true;
    _rowsPerPage = 10;

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
    DataColumn dc5 = DataColumn(
      label: Text('工作单位'),
      onSort: _sort,
    );
    _columnList = [dc1, dc2, dc3, dc4, dc5];

    // 行数据
    _pdtSource = PaginatedDataTableSource();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedDataTable Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: PaginatedDataTable(
                header: Text(
                  'PaginatedDataTableHeader',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      _pdtSource.delete();
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
                sortAscending: _sortAscending,
                sortColumnIndex: _sortColumnIndex,
                rowsPerPage: _rowsPerPage,
                availableRowsPerPage: [5, 8, 10],
                onRowsPerPageChanged: (int value) {
                  setState(() {
                    _rowsPerPage = value;
                  });
                },
                onSelectAll: _pdtSource.selectAll,
                columns: _columnList,
                source: _pdtSource,
              ),
            ),
            DDDDescText(
              textList: [
                '可以做一些复杂功能的数据表格',
                '',
                '',
                'header表格header',
                'actions<Widget>[]定义header中的操作项目',
                '   这里做了一个删除, 选中后点击即可删除条目',
                '',
                '',
                '点击表头触发onSort方法排序',
                'sortColumnIndex排序列号(0开始)',
                'sortAscending(是否升序true/false)',
                'rowsPerPage控制每页显示数量',
                'availableRowsPerPage可供选择的每页显示数量',
                '   这里是[5, 8, 10]',
                'onRowsPerPageChanged',
                '   用户选择每页显示数量变化回调方法',
                'onSelectAll是全选动作的回调方法',
                '',
                '',
                'source数据源(可以理解为行数据)',
                '   需要继承DataTableSource来实现',
                '   getRow行数据用DataRow.byIndex处理',
                '   isRowCountApproximate数量是否近似值',
                '       翻译成人话就是确定总数传false否则true',
                '   rowCount数量',
                '   selectedRowCount选中数量',
                '       要实现DataRow的selected和onSelectChanged',
              ],
            ),
            Container(
              height: 100,
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
    });

    if (0 == index) {
      _pdtSource.sort((item) => item['name'], ascending);
    } else if (1 == index) {
      _pdtSource.sort((item) => item['sex'], ascending);
    } else if (2 == index) {
      _pdtSource.sort((item) => item['age'], ascending);
    } else if (3 == index) {
      _pdtSource.sort((item) => item['school'], ascending);
    } else if (4 == index) {
      _pdtSource.sort((item) => item['company'], ascending);
    }
  }
}

/// 表格的数据源
class PaginatedDataTableSource extends DataTableSource {
  int _selectedCount = 0;
  List<Map> _rowDataList = List.generate(100, (index) {
    return {
      'name': '张$index',
      'sex': index % 2 == 0 ? '男' : '女',
      'age': '${index + 1}',
      'school': '学校${100 - index}',
      'company': '公司$index',
      'checked': false,
    };
  }).toList();

  @override
  DataRow getRow(int index) {
    final Map item = _rowDataList[index];
    return DataRow.byIndex(
      index: index,
      selected: item['checked'],
      onSelectChanged: (bool value) {
        if (item['checked'] != value) {
          _selectedCount += value ? 1 : -1;
          assert(_selectedCount >= 0);
          item['checked'] = value;
          notifyListeners();
        }
      },
      cells: <DataCell>[
        DataCell(Text(item['name'])),
        DataCell(Text(item['sex'])),
        DataCell(Text(item['age'])),
        DataCell(Text(item['school'])),
        DataCell(Text(item['company'])),
      ],
    );
  }

  @override
  // 如果不确定行数, 返回true
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _rowDataList.length;

  @override
  int get selectedRowCount => _selectedCount;

  void sort(getField(item), bool ascending) {
    _rowDataList.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }

      final aValue = getField(a);
      final bValue = getField(b);

      return Comparable.compare(aValue, bValue);
    });

    notifyListeners();
  }

  void selectAll(bool checked) {
    for (var i = 0; i < _rowDataList.length; i++) {
      Map item = _rowDataList[i];
      item['checked'] = checked;
    }
    _selectedCount = checked ? _rowDataList.length : 0;

    notifyListeners();
  }

  void delete() {
    _rowDataList.removeWhere((element) => true == element['checked']);
    _selectedCount = 0;

    notifyListeners();
  }
}
