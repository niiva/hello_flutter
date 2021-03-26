// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/src/router/my_router.dart';
import 'package:hello_flutter/src/router/unknown_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // 滚动性能优化
  // 根据所涉及的频率差异, 启用此标志可以使滚动时的颤动减少多达97%
  GestureBinding.instance.resamplingEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: MyRouter.routes(),
      initialRoute: '/', //初始化的时候加载的路由
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (context) {
            return UnknownPage(settings.name);
          },
        );
      },
    );
  }
}
