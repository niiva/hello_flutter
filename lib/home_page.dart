import 'package:flutter/material.dart';
import 'package:hello_flutter/src/router/my_menu.dart';
import 'package:hello_flutter/src/router/my_router.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList.radio(
        children: MyMenu.menuList.map((value) {
          String name = value['name'];
          List<Map> list = value['list'];
          int count = list.length;
          int done = 0;
          for (var i = 0; i < list.length; i++) {
            Map child = list[i];
            if (child['done']) {
              done++;
            }
          }
          return ExpansionPanelRadio(
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) {
              return ListTile(
                title: Text(
                  '$name($done/$count)',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
            body: Container(
              width: double.infinity,
              height: list.length * 50.0,
              child: Column(
                children: list.map((value) {
                  String subName = value['name'];
                  bool done = value['done'];
                  return GestureDetector(
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 30,
                        top: 10,
                      ),
                      // 底部分割线
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                      ),
                      width: double.infinity,
                      height: 50,
                      child: Text(
                        '$subName',
                        style: TextStyle(
                            fontSize: 18,
                            color: done ? Colors.green : Colors.red),
                      ),
                    ),
                    onTap: () {
                      MyRouter.navigateTo(
                        title: subName,
                        context: context,
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            value: name,
          );
        }).toList(),
      ),
    );
  }
}
