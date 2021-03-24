import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';
import 'package:toast/toast.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _userName;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              onWillPop: _willPop,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 50,
                      left: 50,
                      right: 50,
                    ),
                    child: TextFormField(
                      maxLength: 20,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: '用户名:',
                      ),
                      onSaved: (value) {
                        _userName = value;
                      },
                      validator: _validateUsername,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 50,
                      right: 50,
                    ),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: '密码:',
                      ),
                      onSaved: (value) {
                        _password = value;
                      },
                      validator: _validatePassword,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CupertinoButton(
                    color: Colors.blue,
                    child: Text('Submit'),
                    onPressed: () {
                      _formSubmitted();
                    },
                  ),
                ],
              ),
            ),
            DDDDescText(
              textList: [
                'Form配合TextFormField使用',
                'Form的key用',
                '   GlobalKey<FormState>()初始化',
                '   在submit的时候需要用',
                '   key.currentState来定位Form',
                'onWillPop定义页面即将被关掉时的提示(异步方法)',
                'TextFormField与普通TextField相似',
                '   onSaved的时候处理数据',
                '   validator定义内容验证',
                '       这里验证了用户名不能为空',
                '       密码不能为空',
                '       密码不能少于8位',
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _validateUsername(value) {
    if (value.isEmpty) {
      return '用户名不能为空';
    }
    return null;
  }

  String _validatePassword(value) {
    if (value.isEmpty) {
      return '密码不能为空';
    }

    if (value.length < 8) {
      return '密码长度不能少于8位';
    }

    return null;
  }

  void _formSubmitted() {
    var _form = _formKey.currentState;

    if (_form.validate()) {
      _form.save();
      Toast.show(
        'submit succeed!!!\nuserName:$_userName\npassword:$_password',
        context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.BOTTOM,
      );
    }
  }

  Future<bool> _willPop() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        title: Text('提示'),
        content: Text('你确定要离开此页吗?\n离开此页面会丢失您所填写的表单内容.'),
        actions: <Widget>[
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('确定'),
          ),
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('取消'),
          ),
        ],
      ),
    );
  }
}
