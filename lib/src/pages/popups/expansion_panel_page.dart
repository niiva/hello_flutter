import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class ExpansionPanelPage extends StatefulWidget {
  @override
  _ExpansionPanelPageState createState() => _ExpansionPanelPageState();
}

class _ExpansionPanelPageState extends State<ExpansionPanelPage> {
  bool _p1Expand;
  bool _p2Expand;

  @override
  void initState() {
    super.initState();
    _p1Expand = false;
    _p2Expand = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: 'ExpansionPanel',
            subTitles: [
              'ExpansionPanelList:',
              '   能够同时展开多条',
              '   通过expansionCallback处理点击回调',
              'ExpansionPanel:',
              '   headerBuilder指未展开时的组件',
              '   body是展开的部分',
              '   通过isExpanded控制是否展开',
              '   通过canTapOnHeader控制是否整条点击都有效',
              '',
              '如果想每次只展开一条可以使用:',
              '   ExpansionPanelList.radio构造列表',
              '   ExpansionPanelRadio构造list的item',
              '   *首页就是这样做的*'
            ],
            child: ExpansionPanelList(
              expansionCallback: (index, isExpanded) {
                if (0 == index) {
                  setState(() {
                    print('$isExpanded');
                    _p1Expand = !isExpanded;
                  });
                } else if (1 == index) {
                  setState(() {
                    print('$isExpanded');
                    _p2Expand = !isExpanded;
                  });
                }
              },
              children: [
                ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: _p1Expand,
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      title: Text(
                        'Pannel1',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                  body: Container(
                    height: 100,
                    color: Colors.blue,
                  ),
                ),
                ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: _p2Expand,
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      title: Text(
                        'Pannel2',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                  body: Container(
                    height: 200,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
