import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';
import 'package:intl/intl.dart';

class TimePickerPage extends StatefulWidget {
  @override
  _TimePickerPageState createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePickerPage> {
  DateTime _yearPickerValue;
  DateTime _calendarPickerValue;
  DateTime _datePickerValue;
  TimeOfDay _timePickerValue;

  @override
  void initState() {
    super.initState();
    _yearPickerValue = DateTime.now();
    _calendarPickerValue = DateTime.now();
    _datePickerValue = DateTime.now();
    _timePickerValue = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TimePicker Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: 'YearPicker',
            subTitles: [
              DateFormat('yyyy').format(_yearPickerValue),
            ],
            child: Container(
              alignment: Alignment.center,
              child: Container(
                width: double.infinity,
                height: 200,
                child: YearPicker(
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  selectedDate: _yearPickerValue,
                  onChanged: (date) {
                    setState(() {
                      _yearPickerValue = date;
                    });
                  },
                ),
              ),
            ),
          ),
          DDDCard(
            title: 'CalendarDatePicker',
            subTitles: [
              DateFormat('yyyy-MM-dd').format(_calendarPickerValue),
            ],
            child: Container(
              alignment: Alignment.center,
              child: Container(
                child: CalendarDatePicker(
                  initialDate: _calendarPickerValue,
                  firstDate: DateTime(2000, 1),
                  lastDate: DateTime(2100, 12),
                  onDateChanged: (date) {
                    setState(() {
                      _calendarPickerValue = date;
                    });
                  },
                ),
              ),
            ),
          ),
          DDDCard(
            title: 'showDatePicker',
            subTitles: [
              DateFormat('yyyy-MM-dd').format(_datePickerValue),
            ],
            child: Container(
              alignment: Alignment.center,
              child: CupertinoButton(
                color: Colors.green,
                child: Text('clickMe'),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: _datePickerValue,
                    firstDate: DateTime(2000, 1, 1),
                    lastDate: DateTime(2100, 1, 1),
                  ).then((DateTime val) {
                    if (null != val) {
                      setState(() {
                        _datePickerValue = val;
                      });
                    }
                  }).catchError((err) {
                    print(err);
                  });
                },
              ),
            ),
          ),
          DDDCard(
            title: 'showTimePicker',
            subTitles: [
              DateFormat('hh:mm:ss').format(
                DateTime(
                  2000,
                  1,
                  1,
                  _timePickerValue.hour,
                  _timePickerValue.minute,
                ),
              ),
            ],
            child: Container(
              alignment: Alignment.center,
              child: CupertinoButton(
                color: Colors.green,
                child: Text('clickMe'),
                onPressed: () {
                  showTimePicker(
                    context: context,
                    initialTime: _timePickerValue,
                  ).then((TimeOfDay val) {
                    if (null != val) {
                      setState(() {
                        _timePickerValue = val;
                      });
                    }
                  }).catchError((err) {
                    print(err);
                  });
                },
              ),
            ),
          ),
          DDDCard(
            title: 'CupertinoDatePicker',
            subTitles: [
              'iOS风格的日期选择器',
            ],
            child: Container(
              alignment: Alignment.center,
              child: Container(
                width: double.infinity,
                height: 300,
                child: CupertinoDatePicker(
                  onDateTimeChanged: (date) {},
                ),
              ),
            ),
          ),
          DDDCard(
            title: 'CupertinoTimerPicker',
            subTitles: [
              'iOS风格的时间选择器',
            ],
            child: Container(
              alignment: Alignment.center,
              child: Container(
                width: double.infinity,
                height: 300,
                child: CupertinoTimerPicker(
                  onTimerDurationChanged: (time) {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
