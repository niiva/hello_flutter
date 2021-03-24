import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';
import 'package:toast/toast.dart';

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: '默认样式',
            subTitles: ['只设置了fontSize: 20'],
            child: Text(
              '什么条件都没有',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          DDDCard(
            title: '对齐方式',
            subTitles: [
              '红色:',
              '   textAlign: TextAlign.left',
              '蓝色:',
              '   textAlign: TextAlign.center',
              '绿色:',
              '   textAlign: TextAlign.right',
            ],
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    '左对齐\n左对齐\n左对齐',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    '居中对齐\n居中对齐\n居中对齐',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 22,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    '右对齐\n右对齐\n右对齐',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
          ),
          DDDCard(
            title: '截断方式',
            subTitles: [
              '红色:',
              '   overflow: TextOverflow.clip',
              '绿色:',
              '   overflow: TextOverflow.ellipsis,',
              '蓝色:',
              '   overflow: TextOverflow.fade,',
            ],
            child: Column(
              children: [
                Text(
                  '单1行超出屏幕单行超出屏幕单行超出屏幕单行超出屏幕单行超出屏幕单行超出屏幕单行超出屏幕',
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '单行超出屏幕单行超出屏幕单行超出屏幕单行超出屏幕单行超出屏幕单行超出屏幕单行超出屏幕',
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '单行超出屏幕单行超出屏幕单行超出屏幕单行超出屏幕单行超出屏幕单行超出屏幕单行超出屏幕',
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ],
            ),
          ),
          DDDCard(
            title: '颜色',
            subTitles: [
              'color控制文字颜色',
              'backgroundColor控制背景色',
            ],
            child: Column(
              children: [
                Text(
                  '字体颜色',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                  ),
                ),
                Text(
                  '背景颜色',
                  style: TextStyle(
                    fontSize: 20,
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
          DDDCard(
            title: '字体粗细',
            subTitles: [
              'fontWeight控制字体粗细',
            ],
            child: Column(
              children: [
                Text(
                  '字体变细',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                Text(
                  '字体加粗',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          DDDCard(
            title: '斜体',
            subTitles: [
              'fontStyle: FontStyle.italic',
            ],
            child: Text(
              '斜体',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          DDDCard(
            title: '间距',
            subTitles: [
              '蓝色:',
              '   letterSpacing: 10',
              '黑色:',
              '   普通空格',
              '绿色:',
              '   加了空格',
              '   wordSpacing: 10',
              '   个人理解这个控制空格的大小',
            ],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '字之间距离',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 10,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  '字 与 字 空 格 间 距',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '字 与 字 空格 间距',
                  style: TextStyle(
                    fontSize: 20,
                    wordSpacing: 10,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          DDDCard(
            title: '阴影',
            subTitles: [
              'shadows字段控制阴影',
              '第二行加了blurRadius: 10',
            ],
            child: Column(
              children: [
                Text(
                  '字的阴影(不加模糊)',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 3),
                      ),
                    ],
                  ),
                ),
                Text(
                  '字的阴影(加模糊)',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          offset: Offset(2, 3),
                          blurRadius: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
          DDDCard(
            title: '上划线',
            subTitles: [
              'decoration: TextDecoration.overline',
            ],
            child: Text(
              '文字上划线',
              style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.overline,
              ),
            ),
          ),
          DDDCard(
            title: '删除线',
            subTitles: [
              'decoration: TextDecoration.lineThrough',
            ],
            child: Text(
              '文字删除线',
              style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ),
          DDDCard(
            title: '下划线',
            subTitles: [
              'decoration: TextDecoration.underline',
            ],
            child: Text(
              '文字下划线',
              style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          DDDCard(
            title: '双删除线',
            subTitles: [
              'decoration: TextDecoration.lineThrough',
              'decorationColor: Colors.red',
              'decorationStyle: TextDecorationStyle.double'
            ],
            child: Text(
              '文字双红色删除线样式',
              style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.double,
              ),
            ),
          ),
          DDDCard(
            title: '波浪删除线',
            subTitles: [
              'decoration: TextDecoration.lineThrough',
              'decorationColor: Colors.red',
              'decorationStyle: TextDecorationStyle.wavy',
            ],
            child: Text(
              '文字红色波浪删除线样式',
              style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.wavy,
              ),
            ),
          ),
          DDDCard(
            title: '同时添加「上、中、下」线',
            subTitles: [
              'decoration: TextDecoration.combine',
            ],
            child: Text(
              '同时添加几种线（颜色和样式统一设置）',
              style: TextStyle(
                fontSize: 20,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.wavy,
                decoration: TextDecoration.combine(
                  [
                    TextDecoration.overline,
                    TextDecoration.lineThrough,
                    TextDecoration.underline,
                  ],
                ),
              ),
            ),
          ),
          DDDCard(
            title: '富文本「Text.rich」',
            subTitles: [
              '通过Text.rich构造',
              '通过TextSpan->childeren:[]添加',
              '通过recognizer: TapGestureRecognizer()处理点击事件',
            ],
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '第一段文字11111',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  TextSpan(
                    text: '第二段文字22222',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                  TextSpan(
                      text: '第三段文字加了点击事件',
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.green,
                        backgroundColor: Colors.yellow,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Toast.show(
                            "点击了第三段文字",
                            context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.CENTER,
                          );
                        }),
                  TextSpan(
                    text: '第四段文字4444',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.blue,
                      fontStyle: FontStyle.italic,
                    ),
                  )
                ],
              ),
            ),
          ),
          DDDCard(
            title: '富文本「RichText」',
            subTitles: [
              '通过RichText()构造',
              '通过TextSpan->childeren:[]添加',
              '通过recognizer: TapGestureRecognizer()处理点击事件',
              'Emmm...使用起来没看出什么区别, 但是底层确实不是一个东西',
            ],
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '第一段文字11111',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '第二段文字22222',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                  TextSpan(
                      text: '第三段文字加了点击事件',
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.green,
                        backgroundColor: Colors.yellow,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Toast.show(
                            "点击了第三段文字",
                            context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.CENTER,
                          );
                        }),
                  TextSpan(
                    text: '第四段文字4444',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.blue,
                      fontStyle: FontStyle.italic,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
