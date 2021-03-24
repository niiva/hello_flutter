import 'package:flutter/material.dart';
import 'package:hello_flutter/src/component/ddd_card.dart';

class MediaQueryPage extends StatefulWidget {
  @override
  _MediaQueryPageState createState() => _MediaQueryPageState();
}

class _MediaQueryPageState extends State<MediaQueryPage> {
  @override
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    var data = {
      "size": queryData.size,
      "devicePixelRatio": queryData.devicePixelRatio.toStringAsFixed(1),
      "textScaleFactor": queryData.textScaleFactor.toStringAsFixed(1),
      "platformBrightness": queryData.platformBrightness,
      "padding": queryData.padding,
      "viewInsets": queryData.viewInsets,
      "systemGestureInsets": queryData.padding,
      "viewPadding": queryData.padding,
      "physicalDepth": queryData.padding,
      "alwaysUse24HourFormat": queryData.padding,
      "accessibleNavigation": queryData.alwaysUse24HourFormat,
      "invertColors": queryData.invertColors,
      "highContrast": queryData.highContrast,
      "disableAnimations": queryData.disableAnimations,
      "boldText": queryData.boldText,
      "navigationMode": queryData.navigationMode,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('MediaQuery Page'),
      ),
      body: ListView(
        children: [
          DDDCard(
            title: 'MediaQuery',
            subTitles: [
              'MediaQuery.of(context)',
              '获取屏幕尺寸等信息',
            ],
            child: Column(
              children: [
                ListTile(
                  title: Text('size'),
                  trailing: Text('${data['size']}'),
                ),
                ListTile(
                  title: Text('devicePixelRatio'),
                  trailing: Text('${data['devicePixelRatio']}'),
                ),
                ListTile(
                  title: Text('textScaleFactor'),
                  trailing: Text('${data['devicePixelRatio']}'),
                ),
                ListTile(
                  title: Text('platformBrightness'),
                  trailing: Text('${data['platformBrightness']}'),
                ),
                ListTile(
                  title: Text('padding'),
                  trailing: Text('${data['padding']}'),
                ),
                ListTile(
                  title: Text('viewInsets'),
                  trailing: Text('${data['viewInsets']}'),
                ),
                ListTile(
                  title: Text('systemGestureInsets'),
                  trailing: Text('${data['systemGestureInsets']}'),
                ),
                ListTile(
                  title: Text('viewPadding'),
                  trailing: Text('${data['viewPadding']}'),
                ),
                ListTile(
                  title: Text('physicalDepth'),
                  trailing: Text('${data['physicalDepth']}'),
                ),
                ListTile(
                  title: Text('alwaysUse24HourFormat'),
                  trailing: Text('${data['alwaysUse24HourFormat']}'),
                ),
                ListTile(
                  title: Text('accessibleNavigation'),
                  trailing: Text('${data['accessibleNavigation']}'),
                ),
                ListTile(
                  title: Text('invertColors'),
                  trailing: Text('${data['invertColors']}'),
                ),
                ListTile(
                  title: Text('highContrast'),
                  trailing: Text('${data['highContrast']}'),
                ),
                ListTile(
                  title: Text('disableAnimations'),
                  trailing: Text('${data['disableAnimations']}'),
                ),
                ListTile(
                  title: Text('boldText'),
                  trailing: Text('${data['boldText']}'),
                ),
                ListTile(
                  title: Text('navigationMode'),
                  trailing: Text('${data['navigationMode']}'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
