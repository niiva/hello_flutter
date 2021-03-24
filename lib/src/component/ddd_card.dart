import 'package:flutter/material.dart';

class DDDCard extends StatelessWidget {
  final String title;
  final List<String> subTitles;
  final Widget child;

  DDDCard({
    Key key,
    @required this.title,
    @required this.subTitles,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    String text = '*' + this.subTitles[0];
    for (var i = 1; i < this.subTitles.length; i++) {
      text = text + '\n' + '*' + this.subTitles[i];
    }

    return Card(
      margin: EdgeInsets.all(
        10,
      ),
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            20.0,
          ),
        ),
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(
                15,
              ),
              child: Text(
                '$title',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 15,
              ),
              child: Text(
                '$text',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 1,
              indent: 15,
              endIndent: 15,
            ),
            Container(
              margin: EdgeInsets.all(
                15,
              ),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
