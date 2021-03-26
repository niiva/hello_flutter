import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  final String pageName;

  UnknownPage(this.pageName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('404'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$pageName',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '页面还未创建, 不要着急哦~',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
