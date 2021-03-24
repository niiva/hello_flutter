import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField Page'),
      ),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          DDDCard(
            title: '默认样式',
            subTitles: [
              '默认样式',
            ],
            child: Container(
              padding: EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              height: 80,
              child: TextField(),
            ),
          ),
          DDDCard(
            title: '多行样式',
            subTitles: [
              'maxLines行数(指的是最多显示多少行)',
            ],
            child: Container(
              padding: EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              height: 80,
              child: TextField(
                maxLines: 2,
              ),
            ),
          ),
          DDDCard(
            title: '长度限制',
            subTitles: [
              'maxLength长度',
            ],
            child: Container(
              padding: EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              height: 80,
              child: TextField(
                maxLength: 20,
              ),
            ),
          ),
          DDDCard(
            title: '密码样式',
            subTitles: [
              'obscureText',
            ],
            child: Container(
              padding: EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              height: 80,
              child: TextField(
                obscureText: true,
                maxLength: 20,
              ),
            ),
          ),
          DDDCard(
            title: 'hintText',
            subTitles: [
              'decoration: InputDecoration:',
              '   hintText普通placeholder',
              '   输入开始后隐藏',
            ],
            child: Container(
              padding: EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              height: 80,
              child: TextField(
                maxLength: 20,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'hintText',
                ),
              ),
            ),
          ),
          DDDCard(
            title: 'labelText',
            subTitles: [
              'decoration: InputDecoration:',
              '   labelText移动placeholder',
              '   输入开始后移动到左上角',
            ],
            child: Container(
              padding: EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              height: 80,
              child: TextField(
                maxLength: 20,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'labelText',
                ),
              ),
            ),
          ),
          DDDCard(
            title: 'errorText',
            subTitles: [
              'decoration: InputDecoration:',
              '   errorText错误提示',
              '   触发条件需要自己写',
            ],
            child: Container(
              padding: EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              height: 80,
              child: TextField(
                maxLength: 20,
                decoration: InputDecoration(
                  filled: true,
                  errorText: 'errorText',
                ),
              ),
            ),
          ),
          DDDCard(
            title: 'helperText',
            subTitles: [
              'decoration: InputDecoration:',
              '   helperText提示文字',
            ],
            child: Container(
              padding: EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              height: 80,
              child: TextField(
                maxLength: 20,
                decoration: InputDecoration(
                  filled: true,
                  helperText: 'helperText',
                ),
              ),
            ),
          ),
          DDDCard(
            title: 'suffixText',
            subTitles: [
              'decoration: InputDecoration:',
              '   suffixText后缀文字',
              '   prefixIcon前面图标',
            ],
            child: Container(
              padding: EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              height: 80,
              child: TextField(
                maxLength: 20,
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.local_airport),
                  suffixText: 'airport',
                ),
              ),
            ),
          ),
          DDDCard(
            title: '圆角效果',
            subTitles: [
              'decoration: InputDecoration:',
              '   border: OutlineInputBorder'
            ],
            child: Container(
              padding: EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              height: 80,
              child: TextField(
                maxLength: 20,
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.local_airport),
                  suffixText: 'airport',
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
