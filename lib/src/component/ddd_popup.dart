import 'package:flutter/material.dart';

class DDDPopup extends StatefulWidget {
  final double paddingTop;
  final String title;
  final List menuList;
  final ValueChanged valueChanged;

  const DDDPopup({
    Key key,
    @required this.title,
    @required this.menuList,
    @required this.valueChanged,
    this.paddingTop = 40.0,
  });

  @override
  _DDDPopupState createState() => _DDDPopupState();
}

class _DDDPopupState extends State<DDDPopup> {
  var _value;

  @override
  void initState() {
    super.initState();
    _value = widget.menuList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: widget.paddingTop,
      ),
      child: Row(
        children: [
          Text(
            '${widget.title}:',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          PopupMenuButton(
              child: Card(
                child: Text(
                  '$_value',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              itemBuilder: (BuildContext context) {
                return this._initMenuList();
              },
              onSelected: (value) {
                setState(() {
                  _value = value;
                });
                widget.valueChanged(_value);
              }),
        ],
      ),
    );
  }

  List<PopupMenuItem> _initMenuList() {
    List<PopupMenuItem> menuItemList = [];
    for (var i = 0; i < widget.menuList.length; i++) {
      PopupMenuItem menuItem = PopupMenuItem(
        child: Text(
          '${widget.menuList[i]}',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        value: widget.menuList[i],
      );
      menuItemList.add(menuItem);
    }

    return menuItemList;
  }
}
