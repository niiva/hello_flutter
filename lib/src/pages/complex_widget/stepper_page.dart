import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_desc_text.dart';
import 'package:hello_flutter/src/component/ddd_popup.dart';

class StepperPage extends StatefulWidget {
  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int _currentStep;
  bool _showActions;
  List<MyStep> _stepList;

  @override
  void initState() {
    super.initState();
    _currentStep = 0;
    _showActions = true;

    _stepList = [];
    for (var i = 0; i < 5; i++) {
      MyStep ms = MyStep()
        ..title = '步骤${i + 1}'
        ..content = '当前步骤${i + 1}'
        ..isActive = 0 == i ? true : false
        ..state = 0 == i ? StepState.complete : StepState.indexed;
      _stepList.add(ms);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stepper(
                currentStep: _currentStep,
                steps: _stepList.map((ms) {
                  return Step(
                    title: Text('${ms.title}'),
                    content: Text('${ms.content}'),
                    isActive: ms.isActive,
                    state: ms.state,
                  );
                }).toList(),
                controlsBuilder: (
                  BuildContext context, {
                  VoidCallback onStepContinue,
                  VoidCallback onStepCancel,
                }) {
                  return _showActions
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: _currentStep < 4 ? _next : null,
                              child: const Text('前进'),
                            ),
                            ElevatedButton(
                              onPressed: _currentStep > 0 ? _previous : null,
                              child: const Text('后退'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _zero();
                              },
                              child: const Text('归零'),
                            ),
                          ],
                        )
                      : Container();
                },
              ),
            ),
            DDDPopup(
              title: '是否显示步骤按钮',
              menuList: [
                true,
                false,
              ],
              valueChanged: (value) {
                setState(() {
                  _showActions = value;
                });
              },
            ),
            DDDDescText(
              textList: [
                'Stepper配合Step使用',
                'currentStep当前步骤',
                'controlsBuilder横排按钮(也可以放别的)',
                '   提供了onStepContinue和onStepCancel方法',
                '   如果不想要, 可以返回一个空组件',
                'onStepTapped步骤点击回调',
                'onStepContinue下一步回调',
                'onStepCancel上一步回调',
                '',
                '',
                'Step:',
                '   isActive是否点亮',
                '   state提供了以下几种状态:',
                '       indexed',
                '       editing',
                '       complete',
                '       disabled',
                '       error(默认是亮的)',
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

  void _next() {
    setState(() {
      _currentStep++;
      MyStep ms = _stepList[_currentStep];
      ms.isActive = true;
      ms.state = StepState.complete;
    });
  }

  void _previous() {
    setState(() {
      MyStep ms = _stepList[_currentStep];
      ms.isActive = false;
      ms.state = StepState.indexed;
      _currentStep--;
    });
  }

  void _zero() {
    setState(() {
      _currentStep = 0;
      for (var i = 0; i < _stepList.length; i++) {
        MyStep ms = _stepList[i];
        ms.isActive = 0 == i ? true : false;
        ms.state = 0 == i ? StepState.complete : StepState.indexed;
      }
    });
  }
}

class MyStep {
  String title;
  String content;
  bool isActive;
  StepState state;
}
