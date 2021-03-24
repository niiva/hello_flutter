# hello_flutter

### 项目说明:

- 学习 `Flutter` 的时候做的项目, 把 `Flutter` 的核心知识点整理了一下;
- 页面不是很好看, 不是做视觉设计的, 项目主要是帮助自己对 `Flutter` 加深理解;

### 目录简单说明(lib):

```bash
  ├── component                # 自己封装的几个组件, 都是项目里用到的
  ├── pages                    # 页面
  │   └──basic_widget            # 基础组件
  │   └──layout                  # 常用布局
  │   └──box                     # 常用容器
  │   └──complex_widget          # 一些系统提供的, 封装较完善的组件
  │   └──popups                  # 弹出框
  │   └──scroll                  # 滚动组件及其相关
  │   └──sliver                  # sliver相关组件
  │   └──touchable               # 能够响应交互的组件
  │   └──gesture                 # 手势相关
  │   └──listenable              # 生命周期及监听器
  │   └──async                   # 异步相关
  │   └──motion                  # 带有动画效果的组件
  │   └──animation               # 动画相关
  │   └──canvas                  # canvas实践(相关知识点在box/CustomPaint里面)
  |   └──hot_pubs                # 比较热门的第三方pub
  ├── router                   # 路由
  ├── home_page.dart           # 程序主页面
  ├── main.dart                # 程序入口
```

### 目录说明(assets):

```bash
  ├── fonts                    # 测试用的字体及Icons
  ├── images                   # 测试用的图片
```

---

### 开发&学习日志

- 2020-03-07

  - 0.搭建项目
  - 1.完成页面:
    - Basic Widget/Text
    - Basic Widget/Container
    - Basic Widget/Layout

- 2021-03-08

  - 1.修改首页导航方式, 变更为展开式列表
  - 2.归纳了一下现有组件, 分为基础组件、Layout
  - 3.完成页面:
    - Basic Widget/Image
    - Layout/Flex
    - Layout/Column
    - Layout/Row
    - Layout/Button

- 2021-03-09

  - 1.总结和归纳了 Flutter 核心知识点, 项目目录变为 14 大类 100 多个组件知识点
  - 2.封装了路由, 菜单和路由跳转统一管理和控制
  - 3.完成页面:
    - Layout/Stack
    - Layout/Table
    - Layout/Wrap

- 2021-03-10

  - 1.封装了几个组件, 并把之前代码里重复的部分替换成封装的组件
  - 2.完成组件:
    - DDDDescText
    - DDDPopup
    - DDDRowAddRemove
    - DDDRowRadio
  - 3.完成页面:
    - Layout/Baseline
    - Layout/Align
    - Layout/Offstage
    - Layout/Visibility
    - Touchable/Slider

- 2021-03-11

  - 1.重构了 Container(左右滑动分为 2 个知识点)页面, 新的页面可以左右滑动 Page,
  - 增加了更详细的知识点
  - 2.简单的了解了一下 GestureDetector 和 Canvas 并应用在页面里
  - 3.完成组件:
    - DDDSlider
  - 4.完成页面:
    - Layout/Opacity
    - Layout/AspectRatio
    - Layout/Padding
    - Scroll/PageView
    - Layout/BackdropFilter
    - Layout/RotatedBox
  - 5.半成品
    - Layout/Transform(左右滑动分为 3 个知识点)【完成一半,Canvas 的绘制比较复杂, 明天继续】
    - TODO
      - Canvas 绘制虚线;
      - 顶部组件半透明;
      - Transform.scale 的知识点

- 2021-03-12

  - 1.详细学习了一下 Canvas 的用法, 并在 CustomPaint 里面做了知识点展开
  - 2.整理了一下目录, Button 放到 Touchable 里了
  - 3.完成组件:
    - DDDCard
  - 4.完成页面:
    - Layout/Transform(昨天剩下的都做完了)
    - Layout/CustomPaint
    - Touchable/Radio
    - Basic Widget/Card
    - Basic Widget/Button(用 Card 整理了一下页面)
    - Basic Widget/Text(用 Card 整理了一下页面, 富文本添加了 RichText 构造方式)
    - Scroll/SingleScrollView

- 2021-03-16

  - 1.Flutter 的异步明天再学习, 今天整理了一下 Github 上要学习的项目
  - 2.异步的操作和 Dio 库之后再研究
  - 3.完成页面:
    - Layout/GridView
    - Touchable/CheckBox
    - Async/Timer

- 2021-03-17

  - 1.完成页面:
    - Popups/AlertDialog
    - Popups/BottomSheet
    - Popups/Expansionpanel
    - Popups/SimpleDialog
    - Basic Widget/BottomNavigationBar
    - Basic Widget/Chip
    - Basic Widget/ProgressIndicator
    - Basic Widget/Color
    - Basic Widget/Drawer
    - Basic Widget/FlutterLogo

- 2021-03-18

  - 1.完成页面:
    - Basic Widget/Icon
    - Basic Widget/Overlay
    - Basic Widget/Placeholder
    - Basic Widget/Tabbar
    - Basic Widget/TextField
    - Basic Widget/Tooltip
    - Complex Widget/DataTable

- 2021-03-19

  - 1.完成页面:
    - Complex Widget/PaginatedDataTable
    - Complex Widget/Form
    - Complex Widget/ListTile
    - Complex Widget/Stepper
    - Complex Widget/TimePicker

- 2021-03-20

  - 1.恶补了一下三角形正余弦函数以及笛卡尔曲线原理
  - 2.封装组件:
    - DDDWHSlider
  - 3.完成页面:
    - Basic Widget/Image(用 Card 整理了一下页面, 新增 fitWidth、fitHeight 模式)
    - Layout/Flow
    - Layout/CustomMultiChildLayout
    - Box/Clip
    - Box/ConstrainedBox
    - Box/DecoratedBox
    - Box/FittedBox

- 2021-03-21

  - 1.完成页面
    - Box/SizedBox
    - Box/FractionallySizedBox
    - Box/FractionalTranslation
    - Box/LimitedBox
    - Box/OverflowBox
    - Scroll/ListView
    - Scroll/Scrollbar
    - Scroll/RefreshIndicator

- 2021-03-22

  - 1.完成页面
    - Basic Widget/Container(用 tabbar 整理了一下页面)
    - Box/Transform(用 tabbar 整理了一下页面)
    - Gesture/Pointer(Absorb&Ignore)
    - Gesture/Dismissible
    - Gesture/Draggable(包括 DragTarget&LongPressDraggable)
    - Gesture/DraggableScrollableSheet
    - Gesture/GestureDetector

- 2021-03-23

  - 1.完成页面
    - Listenable/LifeCycle
    - Listenable/StatefulWidgetState
    - Listenable/MediaQuery
    - Listenable/Listener

- 备忘:
  - materialApp，cupertinoApp，widgetsApp
  - Theme
