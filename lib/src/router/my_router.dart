import 'package:flutter/material.dart';
import 'package:hello_flutter/home_page.dart';
import 'package:hello_flutter/src/pages/async/await_async_page.dart';
import 'package:hello_flutter/src/pages/async/completer_page.dart';
import 'package:hello_flutter/src/pages/async/future_page.dart';
import 'package:hello_flutter/src/pages/async/isolate_page.dart';
import 'package:hello_flutter/src/pages/async/stream_page.dart';
import 'package:hello_flutter/src/pages/async/timer_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/bottom_navigation_bar_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/card_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/chip_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/color_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/container_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/drawer_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/flutter_logo_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/icon_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/image_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/overlay_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/placeholder_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/progress_indicator_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/tabbar_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/text_field_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/text_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/tooltip_page.dart';
import 'package:hello_flutter/src/pages/box/align_page.dart';
import 'package:hello_flutter/src/pages/box/aspect_ratio_page.dart';
import 'package:hello_flutter/src/pages/box/backdrop_filter_page.dart';
import 'package:hello_flutter/src/pages/box/baseline_page.dart';
import 'package:hello_flutter/src/pages/box/clip_page.dart';
import 'package:hello_flutter/src/pages/box/constrained_box_page.dart';
import 'package:hello_flutter/src/pages/box/custom_paint_page.dart';
import 'package:hello_flutter/src/pages/box/decorated_box_page.dart';
import 'package:hello_flutter/src/pages/box/fitted_box_page.dart';
import 'package:hello_flutter/src/pages/box/fractional_translation_page.dart';
import 'package:hello_flutter/src/pages/box/fractionally_sized_box_page.dart';
import 'package:hello_flutter/src/pages/box/limited_box_page.dart';
import 'package:hello_flutter/src/pages/box/offstage_page.dart';
import 'package:hello_flutter/src/pages/box/opacity_page.dart';
import 'package:hello_flutter/src/pages/box/overflow_box_page.dart';
import 'package:hello_flutter/src/pages/box/padding_page.dart';
import 'package:hello_flutter/src/pages/box/rotated_box_page.dart';
import 'package:hello_flutter/src/pages/box/sized_box_page.dart';
import 'package:hello_flutter/src/pages/box/transform_page.dart';
import 'package:hello_flutter/src/pages/box/visibility_page.dart';
import 'package:hello_flutter/src/pages/complex_widget/data_table_page.dart';
import 'package:hello_flutter/src/pages/complex_widget/form_page.dart';
import 'package:hello_flutter/src/pages/complex_widget/list_tile_page.dart';
import 'package:hello_flutter/src/pages/complex_widget/paginated_data_table_page.dart';
import 'package:hello_flutter/src/pages/complex_widget/stepper_page.dart';
import 'package:hello_flutter/src/pages/complex_widget/time_picker_page.dart';
import 'package:hello_flutter/src/pages/gesture/dismissble_page.dart';
import 'package:hello_flutter/src/pages/gesture/draggable_page.dart';
import 'package:hello_flutter/src/pages/gesture/draggable_scrollable_sheet.dart';
import 'package:hello_flutter/src/pages/gesture/gesture_detector_page.dart';
import 'package:hello_flutter/src/pages/gesture/pointer_page.dart';
import 'package:hello_flutter/src/pages/layout/column_page.dart';
import 'package:hello_flutter/src/pages/layout/custom_multi_child_layout.dart';
import 'package:hello_flutter/src/pages/layout/flex_page.dart';
import 'package:hello_flutter/src/pages/layout/flow_page.dart';
import 'package:hello_flutter/src/pages/layout/grid_view_page.dart';
import 'package:hello_flutter/src/pages/layout/row_page.dart';
import 'package:hello_flutter/src/pages/layout/stack_page.dart';
import 'package:hello_flutter/src/pages/layout/table_page.dart';
import 'package:hello_flutter/src/pages/layout/wrap_page.dart';
import 'package:hello_flutter/src/pages/listenable/life_cycle_page.dart';
import 'package:hello_flutter/src/pages/listenable/listener_page.dart';
import 'package:hello_flutter/src/pages/listenable/media_query_page.dart';
import 'package:hello_flutter/src/pages/listenable/stateful_widget_state_page.dart';
import 'package:hello_flutter/src/pages/popups/alert_dialog_page.dart';
import 'package:hello_flutter/src/pages/popups/bottom_sheet_page.dart';
import 'package:hello_flutter/src/pages/popups/expansion_panel_page.dart';
import 'package:hello_flutter/src/pages/popups/simple_dialog_page.dart';
import 'package:hello_flutter/src/pages/scroll/list_view_page.dart';
import 'package:hello_flutter/src/pages/scroll/page_view_page.dart';
import 'package:hello_flutter/src/pages/scroll/refresh_indicator_page.dart';
import 'package:hello_flutter/src/pages/scroll/scrollbar_page.dart';
import 'package:hello_flutter/src/pages/scroll/single_child_scroll_view_page.dart';
import 'package:hello_flutter/src/pages/touchable/button_page.dart';
import 'package:hello_flutter/src/pages/touchable/check_box_page.dart';
import 'package:hello_flutter/src/pages/touchable/radio_page.dart';
import 'package:hello_flutter/src/pages/touchable/slider_page.dart';

class MyRouter {
  static List menuList = [
    {
      'name': 'Basic Widget',
      'list': [
        {
          'name': 'BottomNavigationBar',
          'done': true,
          'route': '/basic_widget/bottom_navigation_bar',
          'page': (context) => BottomNavigationBarPage(),
        },
        {
          'name': 'Card',
          'done': true,
          'route': '/basic_widget/card',
          'page': (context) => CardPage(),
        },
        {
          'name': 'Chip',
          'done': true,
          'route': '/basic_widget/chip',
          'page': (context) => ChipPage(),
        },
        {
          'name': 'ProgressIndicator',
          'done': true,
          'route': '/basic_widget/progress_indicator',
          'page': (context) => ProgressIndicatorPage(),
        },
        {
          'name': 'Container',
          'done': true,
          'route': '/basic_widget/container',
          'page': (context) => ContainerPage(),
        },
        {
          'name': 'Color',
          'done': true,
          'route': '/basic_widget/color',
          'page': (context) => ColorPage(),
        },
        {
          'name': 'Drawer',
          'done': true,
          'route': '/basic_widget/drawer',
          'page': (context) => DrawerPage(),
        },
        {
          'name': 'FlutterLogo',
          'done': true,
          'route': '/basic_widget/flutter_logo',
          'page': (context) => FlutterLogoPage(),
        },
        {
          'name': 'Icon',
          'done': true,
          'route': '/basic_widget/icon',
          'page': (context) => IconPage(),
        },
        {
          'name': 'Image',
          'done': true,
          'route': '/basic_widget/image',
          'page': (context) => ImagePage(),
        },
        {
          'name': 'Overlay',
          'done': true,
          'route': '/basic_widget/overlay',
          'page': (context) => OverlayPage(),
        },
        {
          'name': 'Placeholder',
          'done': true,
          'route': '/basic_widget/placeholder',
          'page': (context) => PlaceholderPage(),
        },
        {
          'name': 'Tabbar',
          'done': true,
          'route': '/basic_widget/tabbar',
          'page': (context) => TabbarPage(),
        },
        {
          'name': 'Text',
          'done': true,
          'route': '/basic_widget/text',
          'page': (context) => TextPage(),
        },
        {
          'name': 'TextField',
          'done': true,
          'route': '/basic_widget/text_field',
          'page': (context) => TextFieldPage(),
        },
        {
          'name': 'Tooltip',
          'done': true,
          'route': '/basic_widget/tooltip',
          'page': (context) => TooltipPage(),
        },
      ],
    },
    {
      'name': 'Layout',
      'list': [
        {
          'name': 'Column',
          'done': true,
          'route': '/layout/column',
          'page': (context) => ColumnPage(),
        },
        {
          'name': 'CustomMultiChildLayout',
          'done': true,
          'route': '/layout/custom_multi_child_layout',
          'page': (context) => CustomMultiChildLayoutPage(),
        },
        {
          'name': 'Flex',
          'done': true,
          'route': '/layout/flex',
          'page': (context) => FlexPage(),
        },
        {
          'name': 'Flow',
          'done': true,
          'route': '/layout/flow',
          'page': (context) => FlowPage(),
        },
        {
          'name': 'GridView',
          'done': true,
          'route': '/layout/grid_view',
          'page': (context) => GridViewPage(),
        },
        {
          'name': 'Row',
          'done': true,
          'route': '/layout/row',
          'page': (context) => RowPage(),
        },
        {
          'name': 'Stack',
          'done': true,
          'route': '/layout/stack',
          'page': (context) => StackPage(),
        },
        {
          'name': 'Table',
          'done': true,
          'route': '/layout/table',
          'page': (context) => TablePage(),
        },
        {
          'name': 'Wrap',
          'done': true,
          'route': '/layout/wrap',
          'page': (context) => WrapPage(),
        },
      ],
    },
    {
      'name': 'Box',
      'list': [
        {
          'name': 'Align',
          'done': true,
          'route': '/box/align',
          'page': (context) => AlignPage(),
        },
        {
          'name': 'AspectRatio',
          'done': true,
          'route': '/box/aspect_ratio',
          'page': (context) => AspectRatioPage(),
        },
        {
          'name': 'BackdropFilter',
          'done': true,
          'route': '/box/backdrop_filter',
          'page': (context) => BackdropFilterPage(),
        },
        {
          'name': 'Baseline',
          'done': true,
          'route': '/box/base_line',
          'page': (context) => BaselinePage(),
        },
        {
          'name': 'Clip',
          'done': true,
          'route': '/box/clip',
          'page': (context) => ClipPage(),
        },
        {
          'name': 'ConstrainedBox',
          'done': true,
          'route': '/box/constrained_box',
          'page': (context) => ConstrainedBoxPage(),
        },
        {
          'name': 'CustomPaint',
          'done': true,
          'route': '/box/custom_paint',
          'page': (context) => CustomPaintPage(),
        },
        {
          'name': 'DecoratedBox',
          'done': true,
          'route': '/box/decorated_box',
          'page': (context) => DecoratedBoxPage(),
        },
        {
          'name': 'FittedBox',
          'done': true,
          'route': '/box/fitted_box',
          'page': (context) => FittedBoxPage(),
        },
        {
          'name': 'FractionallySizedBox',
          'done': true,
          'route': '/box/fractionally_sized_box',
          'page': (context) => FractionallySizedBoxPage(),
        },
        {
          'name': 'FractionalTranslation',
          'done': true,
          'route': '/box/fractional_translation',
          'page': (context) => FractionalTranslationPage(),
        },
        {
          'name': 'LimitedBox',
          'done': true,
          'route': '/box/limited_box',
          'page': (context) => LimitedBoxPage(),
        },
        {
          'name': 'Offstage',
          'done': true,
          'route': '/box/offstage',
          'page': (context) => OffstagePage(),
        },
        {
          'name': 'Opacity',
          'done': true,
          'route': '/box/opacity',
          'page': (context) => OpacityPage(),
        },
        {
          'name': 'OverflowBox',
          'done': true,
          'route': '/box/overflow_box',
          'page': (context) => OverflowBoxPage(),
        },
        {
          'name': 'Padding',
          'done': true,
          'route': '/box/padding',
          'page': (context) => PaddingPage(),
        },
        {
          'name': 'RotatedBox',
          'done': true,
          'route': '/box/rotated_box',
          'page': (context) => RotatedBoxPage(),
        },
        {
          'name': 'SizedBox',
          'done': true,
          'route': '/box/sized_box',
          'page': (context) => SizedBoxPage(),
        },
        {
          'name': 'Transform',
          'done': true,
          'route': '/box/transfrom',
          'page': (context) => TransformPage(),
        },
        {
          'name': 'Visibility',
          'done': true,
          'route': '/box/visibility',
          'page': (context) => VisibilityPage(),
        },
      ],
    },
    {
      'name': 'Complex Widget',
      'list': [
        {
          'name': 'DataTable',
          'done': true,
          'route': '/complex_widget/data_table',
          'page': (context) => DataTablePage(),
        },
        {
          'name': 'PaginatedDataTable',
          'done': true,
          'route': '/complex_widget/paginated_data_table',
          'page': (context) => PaginatedDataTablePage(),
        },
        {
          'name': 'Form',
          'done': true,
          'route': '/complex_widget/form',
          'page': (context) => FormPage(),
        },
        {
          'name': 'ListTile',
          'done': true,
          'route': '/complex_widget/listile',
          'page': (context) => ListTilePage(),
        },
        {
          'name': 'Stepper',
          'done': true,
          'route': '/complex_widget/stepper',
          'page': (context) => StepperPage(),
        },
        {
          'name': 'TimePicker',
          'done': true,
          'route': '/complex_widget/time_picker',
          'page': (context) => TimePickerPage(),
        },
      ],
    },
    {
      'name': 'Popups',
      'list': [
        {
          'name': 'AlertDialog',
          'done': true,
          'route': '/popups/alert_dialog',
          'page': (context) => AlertDialogPage(),
        },
        {
          'name': 'BottomSheet',
          'done': true,
          'route': '/popups/bottom_sheet',
          'page': (context) => BottomSheetPage(),
        },
        {
          'name': 'ExpansionPanel',
          'done': true,
          'route': '/popups/expansion_panel',
          'page': (context) => ExpansionPanelPage(),
        },
        {
          'name': 'SimpleDialog',
          'done': true,
          'route': '/popups/simple_dialog',
          'page': (context) => SimpleDialogPage(),
        },
      ],
    },
    {
      'name': 'Scroll',
      'list': [
        {
          'name': 'ListView',
          'done': true,
          'route': '/scroll/list_view',
          'page': (context) => ListViewPage(),
        },
        {
          'name': 'PageView',
          'done': true,
          'route': '/scroll/page_view',
          'page': (context) => PageViewPage(),
        },
        {
          'name': 'RefreshIndicator',
          'done': true,
          'route': '/scroll/refresh_indicator',
          'page': (context) => RefreshIndicatorPage(),
        },
        {
          'name': 'Scrollbar',
          'done': true,
          'route': '/scroll/scrollbar',
          'page': (context) => ScrollBarPage(),
        },
        {
          'name': 'SingleChildScrollView',
          'done': true,
          'route': '/scroll/single_child_scroll_view',
          'page': (context) => SingleChildScrollViewPage(),
        },
      ],
    },
    {
      'name': 'Sliver',
      'list': [
        {
          'name': 'CustomScrollView',
          'done': false,
          'route': '/sliver/custom_scroll_view',
          'page': null,
        },
        {
          'name': 'NestedScrollView',
          'done': false,
          'route': '/sliver/nested_scroll_view',
          'page': null,
        },
        {
          'name': 'CupertinoSliverNavigationBar',
          'done': false,
          'route': '/sliver/cupertino_sliver_navigation_bar',
          'page': null,
        },
        {
          'name': 'CupertinoSliverRefreshControl',
          'done': false,
          'route': '/sliver/cupertino_sliver_refresh_control',
          'page': null,
        },
        {
          'name': 'SliverAppBar',
          'done': false,
          'route': '/sliver/sliver_app_bar',
          'page': null,
        },
        {
          'name': 'SliverChildBuilderDelegate',
          'done': false,
          'route': '/sliver/sliver_child_builder_delegate',
          'page': null,
        },
        {
          'name': 'SliverChildListDelegate',
          'done': false,
          'route': '/sliver/sliver_child_list_delegate',
          'page': null,
        },
        {
          'name': 'SliverFillRemaining',
          'done': false,
          'route': '/sliver/sliver_fill_remaining',
          'page': null,
        },
        {
          'name': 'SliverFixedExtentList',
          'done': false,
          'route': '/sliver/sliver_fixed_extent_list',
          'page': null,
        },
        {
          'name': 'SliverGrid',
          'done': false,
          'route': '/sliver/sliver_grid',
          'page': null,
        },
        {
          'name': 'SliverLayoutBuilder',
          'done': false,
          'route': '/sliver/sliver_layout_builder',
          'page': null,
        },
        {
          'name': 'SliverList',
          'done': false,
          'route': '/sliver/sliver_list',
          'page': null,
        },
        {
          'name': 'SliverOverlapAbsorber',
          'done': false,
          'route': '/sliver/sliver_overlap_absorber',
          'page': null,
        },
        {
          'name': 'SliverOverlapInjector',
          'done': false,
          'route': '/sliver/sliver_overlap_injector',
          'page': null,
        },
        {
          'name': 'SliverPadding',
          'done': false,
          'route': '/sliver/sliver_padding',
          'page': null,
        },
        {
          'name': 'SliverPersistentHeader',
          'done': false,
          'route': '/sliver/sliver_persistent_header',
          'page': null,
        },
        {
          'name': 'SliverToBoxAdapter',
          'done': false,
          'route': '/sliver/sliver_to_box_adapter',
          'page': null,
        },
      ],
    },
    {
      'name': 'Touchable',
      'list': [
        {
          'name': 'Button',
          'done': true,
          'route': '/touchable/button',
          'page': (context) => ButtonPage(),
        },
        {
          'name': 'CheckBox',
          'done': true,
          'route': '/touchable/check_box',
          'page': (context) => CheckBoxPage(),
        },
        {
          'name': 'Radio',
          'done': true,
          'route': '/touchable/radio',
          'page': (context) => RadioPage(),
        },
        {
          'name': 'Slider',
          'done': true,
          'route': '/touchable/slider',
          'page': (context) => SliderPage(),
        },
      ],
    },
    {
      'name': 'Gesture',
      'list': [
        {
          'name': 'Pointer(Absorb&Ignore)',
          'done': true,
          'route': '/gesture/pointer',
          'page': (context) => PointerPage(),
        },
        {
          'name': 'Dismissible',
          'done': true,
          'route': '/gesture/dismissible',
          'page': (context) => DismissiblePage(),
        },
        {
          'name': 'Draggable',
          'done': true,
          'route': '/gesture/draggable',
          'page': (context) => DraggablePage(),
        },
        {
          'name': 'DraggableScrollableSheet',
          'done': true,
          'route': '/gesture/draggable_scrollable_sheet',
          'page': (context) => DraggableScrollableSheetPage(),
        },
        {
          'name': 'GestureDetector',
          'done': true,
          'route': '/gesture/gesture_detector',
          'page': (context) => GestureDetectorPage(),
        },
      ],
    },
    {
      'name': 'Listenable',
      'list': [
        {
          'name': 'LifeCycle',
          'done': true,
          'route': '/listenable/life_cycle',
          'page': (context) => LifeCyclePage(),
        },
        {
          'name': 'StatefulWidgetState',
          'done': true,
          'route': '/listenable/stateful_widget_state',
          'page': (context) => StatefulWidgetStatePage(),
        },
        {
          'name': 'MediaQuery',
          'done': true,
          'route': '/listenable/media_query',
          'page': (context) => MediaQueryPage(),
        },
        {
          'name': 'StreamBuilder',
          'done': false,
          'route': '/listenable/stream_builder',
          'page': null,
        },
        {
          'name': 'FutureBuilder',
          'done': false,
          'route': '/listenable/future_builder',
          'page': null,
        },
        {
          'name': 'InheritedWidget',
          'done': false,
          'route': '/listenable/inherited_widget',
          'page': null,
        },
        {
          'name': 'Listener',
          'done': true,
          'route': '/listenable/listener',
          'page': (context) => ListenerPage(),
        },
        {
          'name': 'NotificationListener',
          'done': false,
          'route': '/listenable/notification_listener',
          'page': null,
        },
        {
          'name': 'RawKeyboardListener',
          'done': false,
          'route': '/listenable/rawKeyboard_listener',
          'page': null,
        },
        {
          'name': 'ValueListenableBuilder',
          'done': false,
          'route': '/listenable/value_listenable_builder',
          'page': null,
        },
      ],
    },
    {
      'name': 'Async',
      'list': [
        {
          'name': 'Timer',
          'done': true,
          'route': '/async/',
          'page': (context) => TimerPage(),
        },
        {
          'name': 'await&async',
          'done': true,
          'route': '/async/',
          'page': (context) => AwaitAsyncPage(),
        },
        {
          'name': 'Future',
          'done': true,
          'route': '/async/future',
          'page': (context) => FuturePage(),
        },
        {
          'name': 'Stream',
          'done': true,
          'route': '/async/stream',
          'page': (context) => StreamPage(),
        },
        {
          'name': 'Completer',
          'done': true,
          'route': '/async/completer',
          'page': (context) => CompleterPage(),
        },
        {
          'name': 'Isolate',
          'done': true,
          'route': '/async/isolate',
          'page': (context) => IsolatePage(),
        },
      ],
    },
    {
      'name': 'Motion',
      'list': [
        {
          'name': 'AnimatedAlign',
          'done': false,
          'route': '/motion/animated_align',
          'page': null,
        },
        {
          'name': 'AnimatedBuilder',
          'done': false,
          'route': '/motion/animated_builder',
          'page': null,
        },
        {
          'name': 'AnimatedContainer',
          'done': false,
          'route': '/motion/animated_container',
          'page': null,
        },
        {
          'name': 'AnimatedCrossFade',
          'done': false,
          'route': '/motion/animated_cross_fade',
          'page': null,
        },
        {
          'name': 'AnimatedDefaultTextStyle',
          'done': false,
          'route': '/motion/animated_default_text_style',
          'page': null,
        },
        {
          'name': 'AnimatedListState',
          'done': false,
          'route': '/motion/animated_list_state',
          'page': null,
        },
        {
          'name': 'AnimatedModalBarrier',
          'done': false,
          'route': '/motion/animated_modal_barrier',
          'page': null,
        },
        {
          'name': 'AnimatedOpacity',
          'done': false,
          'route': '/motion/animated_opacity',
          'page': null,
        },
        {
          'name': 'AnimatedPhysicalModel',
          'done': false,
          'route': '/motion/animated_physical_model',
          'page': null,
        },
        {
          'name': 'AnimatedPositioned',
          'done': false,
          'route': '/motion/animated_positioned',
          'page': null,
        },
        {
          'name': 'AnimatedSize',
          'done': false,
          'route': '/motion/animated_size',
          'page': null,
        },
        {
          'name': 'AnimatedWidget',
          'done': false,
          'route': '/motion/animated_widget',
          'page': null,
        },
        {
          'name': 'AnimatedWidgetBaseState',
          'done': false,
          'route': '/motion/animated_widget_base_state',
          'page': null,
        },
        {
          'name': 'DecoratedBoxTransition',
          'done': false,
          'route': '/motion/decorated_box_transition',
          'page': null,
        },
        {
          'name': 'FadeTransition',
          'done': false,
          'route': '/motion/fade_transition',
          'page': null,
        },
        {
          'name': 'Hero',
          'done': false,
          'route': '/motion/hero',
          'page': null,
        },
        {
          'name': 'PositionedTransition',
          'done': false,
          'route': '/motion/positioned_transition',
          'page': null,
        },
        {
          'name': 'RotationTransition',
          'done': false,
          'route': '/motion/rotation_transition',
          'page': null,
        },
        {
          'name': 'ScaleTransition',
          'done': false,
          'route': '/motion/scale_transition',
          'page': null,
        },
        {
          'name': 'SizeTransition',
          'done': false,
          'route': '/motion/size_transition',
          'page': null,
        },
        {
          'name': 'SlideTransition',
          'done': false,
          'route': '/motion/slide_transition',
          'page': null,
        },
        {
          'name': 'SliverAnimatedList',
          'done': false,
          'route': '/motion/sliver_animated_list',
          'page': null,
        },
      ],
    },
    {
      'name': 'Animation',
      'list': [
        {
          'name': 'Animation',
          'done': false,
          'route': '/animation/animation',
          'page': null,
        },
      ]
    },
    {
      'name': 'Canvas',
      'list': [
        {
          'name': 'Canvas',
          'done': false,
          'route': '/canvas/canvas',
          'page': null,
        },
      ]
    },
    {
      'name': 'HotPubs',
      'list': [
        {
          'name': 'webview_flutter',
          'done': false,
          'route': '/hot_pubs/webview_flutter',
          'page': null,
        },
        {
          'name': 'dio',
          'done': false,
          'route': '/hot_pubs/dio',
          'page': null,
        },
      ]
    },
  ];

  static Map<String, WidgetBuilder> routes() {
    Map<String, WidgetBuilder> routes = {
      '/': (context) => HomePage(),
    };
    for (var i = 0; i < menuList.length; i++) {
      Map menuItem = menuList[i];
      List pageList = menuItem['list'];
      for (var j = 0; j < pageList.length; j++) {
        Map pageItem = pageList[j];
        if (null != pageItem['page']) {
          routes[pageItem['route']] = pageItem['page'];
        }
      }
    }

    return routes;
  }
}
