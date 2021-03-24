import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stack'),
        ),
        body: Stack(
          children: [
            Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.lightGreen,
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'first',
                                  style: TextStyle(
                                    backgroundColor: Colors.red,
                                    fontSize: 24,
                                  ),
                                ),
                                Text(
                                  'Second',
                                  style: TextStyle(
                                    backgroundColor: Colors.red,
                                    fontSize: 24,
                                  ),
                                ),
                                Text(
                                  'Third',
                                  style: TextStyle(
                                    backgroundColor: Colors.red,
                                    fontSize: 24,
                                  ),
                                )
                              ],
                            ))
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.lightBlue,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 50,
              left: 50,
              right: 50,
              height: 50,
              child: Container(
                color: Colors.red,
                child: Text(
                  'Stack绝对布局, 可以放在任意位置',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ));
  }
}
