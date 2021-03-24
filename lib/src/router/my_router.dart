import 'package:flutter/material.dart';
import 'package:hello_flutter/src/pages/async/future_page.dart';
import 'package:hello_flutter/src/pages/async/timer_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/bottom_navigation_bar_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/chip_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/color_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/drawer_page.dart';
import 'package:hello_flutter/src/pages/box/fitted_box_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/flutter_logo_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/icon_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/overlay_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/placeholder_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/progress_indicator_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/tabbar_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/text_field_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/tooltip_page.dart';
import 'package:hello_flutter/src/pages/box/clip_page.dart';
import 'package:hello_flutter/src/pages/box/constrained_box_page.dart';
import 'package:hello_flutter/src/pages/box/decorated_box_page.dart';
import 'package:hello_flutter/src/pages/box/fractional_translation_page.dart';
import 'package:hello_flutter/src/pages/box/fractionally_sized_box_page.dart';
import 'package:hello_flutter/src/pages/box/limited_box_page.dart';
import 'package:hello_flutter/src/pages/box/overflow_box_page.dart';
import 'package:hello_flutter/src/pages/box/sized_box_page.dart';
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
import 'package:hello_flutter/src/pages/layout/custom_muti_child_layout.dart';
import 'package:hello_flutter/src/pages/listenable/life_cycle_page.dart';
import 'package:hello_flutter/src/pages/listenable/listener_page.dart';
import 'package:hello_flutter/src/pages/listenable/media_query_page.dart';
import 'package:hello_flutter/src/pages/listenable/notification_listener_page.dart';
import 'package:hello_flutter/src/pages/listenable/stateful_widget_state_page.dart';
import 'package:hello_flutter/src/pages/popups/alert_dialog_page.dart';
import 'package:hello_flutter/src/pages/popups/bottom_sheet_page.dart';
import 'package:hello_flutter/src/pages/popups/expansion_panel_page.dart';
import 'package:hello_flutter/src/pages/popups/simple_dialog_page.dart';
import 'package:hello_flutter/src/pages/scroll/list_view_page.dart';
import 'package:hello_flutter/src/pages/scroll/refresh_indicator_page.dart';
import 'package:hello_flutter/src/pages/scroll/scrollbar_page.dart';
import 'package:hello_flutter/src/pages/touchable/button_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/card_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/image_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/text_page.dart';
import 'package:hello_flutter/src/pages/box/align_page.dart';
import 'package:hello_flutter/src/pages/box/aspect_ratio_page.dart';
import 'package:hello_flutter/src/pages/box/backdrop_filter_page.dart';
import 'package:hello_flutter/src/pages/box/baseline_page.dart';
import 'package:hello_flutter/src/pages/box/custom_paint_page.dart';
import 'package:hello_flutter/src/pages/box/offstage_page.dart';
import 'package:hello_flutter/src/pages/box/opacity_page.dart';
import 'package:hello_flutter/src/pages/box/padding_page.dart';
import 'package:hello_flutter/src/pages/box/rotated_box_page.dart';
import 'package:hello_flutter/src/pages/box/transform_page.dart';
import 'package:hello_flutter/src/pages/box/visibility_page.dart';
import 'package:hello_flutter/src/pages/layout/column_page.dart';
import 'package:hello_flutter/src/pages/basic_widget/container_page.dart';
import 'package:hello_flutter/src/pages/layout/flex_page.dart';
import 'package:hello_flutter/src/pages/layout/flow_page.dart';
import 'package:hello_flutter/src/pages/layout/grid_view_page.dart';
import 'package:hello_flutter/src/pages/layout/row_page.dart';
import 'package:hello_flutter/src/pages/layout/stack_page.dart';
import 'package:hello_flutter/src/pages/layout/table_page.dart';
import 'package:hello_flutter/src/pages/layout/wrap_page.dart';
import 'package:hello_flutter/src/pages/scroll/page_view_page.dart';
import 'package:hello_flutter/src/pages/scroll/single_child_scroll_view_page.dart';
import 'package:hello_flutter/src/pages/touchable/check_box_page.dart';
import 'package:hello_flutter/src/pages/touchable/radio_page.dart';
import 'package:hello_flutter/src/pages/touchable/slider_page.dart';
import 'package:toast/toast.dart';

class MyRouter {
  static void navigateTo({
    @required String title,
    @required BuildContext context,
  }) {
    Widget routeTo;
    switch (title) {
      case 'Text':
        routeTo = TextPage();
        break;
      case 'Button':
        routeTo = ButtonPage();
        break;
      case 'Container':
        routeTo = ContainerPage();
        break;
      case 'Image':
        routeTo = ImagePage();
        break;
      case 'Flex':
        routeTo = FlexPage();
        break;
      case 'Column':
        routeTo = ColumnPage();
        break;
      case 'Row':
        routeTo = RowPage();
        break;
      case 'Stack':
        routeTo = StackPage();
        break;
      case 'Flow':
        routeTo = FlowPage();
        break;
      case 'Table':
        routeTo = TablePage();
        break;
      case 'Wrap':
        routeTo = WrapPage();
        break;
      case 'Baseline':
        routeTo = BaselinePage();
        break;
      case 'Align':
        routeTo = AlignPage();
        break;
      case 'Offstage':
        routeTo = OffstagePage();
        break;
      case 'Visibility':
        routeTo = VisibilityPage();
        break;
      case 'Slider':
        routeTo = SliderPage();
        break;
      case 'Opacity':
        routeTo = OpacityPage();
        break;
      case 'AspectRatio':
        routeTo = AspectRatioPage();
        break;
      case 'Padding':
        routeTo = PaddingPage();
        break;
      case 'PageView':
        routeTo = PageViewPage();
        break;
      case 'BackdropFilter':
        routeTo = BackdropFilterPage();
        break;
      case 'RotatedBox':
        routeTo = RotatedBoxPage();
        break;
      case 'Transform':
        routeTo = TransformPage();
        break;
      case 'CustomPaint':
        routeTo = CustomPaintPage();
        break;
      case 'Radio':
        routeTo = RadioPage();
        break;
      case 'Card':
        routeTo = CardPage();
        break;
      case 'SingleChildScrollView':
        routeTo = SingleChildScrollViewPage();
        break;
      case 'GridView':
        routeTo = GridViewPage();
        break;
      case 'CheckBox':
        routeTo = CheckBoxPage();
        break;
      case 'Timer':
        routeTo = TimerPge();
        break;
      case 'AlertDialog':
        routeTo = AlertDialogPage();
        break;
      case 'SimpleDialog':
        routeTo = SimpleDialogPage();
        break;
      case 'BottomSheet':
        routeTo = BottomSheetPage();
        break;
      case 'ExpansionPanel':
        routeTo = ExpansionPanelPage();
        break;
      case 'BottomNavigationBar':
        routeTo = BottomNavigationBarPage();
        break;
      case 'Chip':
        routeTo = ChipPage();
        break;
      case 'ProgressIndicator':
        routeTo = ProgressIndicatorPage();
        break;
      case 'Color':
        routeTo = ColorPage();
        break;
      case 'Drawer':
        routeTo = DrawerPage();
        break;
      case 'FlutterLogo':
        routeTo = FlutterLogoPage();
        break;
      case 'Icon':
        routeTo = IconPage();
        break;
      case 'Overlay':
        routeTo = OverlayPage();
        break;
      case 'Placeholder':
        routeTo = PlaceholderPage();
        break;
      case 'Tabbar':
        routeTo = TabbarPage();
        break;
      case 'TextField':
        routeTo = TextFieldPage();
        break;
      case 'Tooltip':
        routeTo = TooltipPage();
        break;
      case 'DataTable':
        routeTo = DataTablePage();
        break;
      case 'PaginatedDataTable':
        routeTo = PaginatedDataTablePage();
        break;
      case 'Form':
        routeTo = FormPage();
        break;
      case 'ListTile':
        routeTo = ListTilePage();
        break;
      case 'Stepper':
        routeTo = StepperPage();
        break;
      case 'TimePicker':
        routeTo = TimePickerPage();
        break;
      case 'CustomMultiChildLayout':
        routeTo = CustomMutiChildLayoutPage();
        break;
      case 'Clip':
        routeTo = ClipPage();
        break;
      case 'ConstrainedBox':
        routeTo = ConstrainedBoxPage();
        break;
      case 'DecoratedBox':
        routeTo = DecoratedBoxPage();
        break;
      case 'FittedBox':
        routeTo = FittedBoxPage();
        break;
      case 'SizedBox':
        routeTo = SizedBoxPage();
        break;
      case 'FractionallySizedBox':
        routeTo = FractionallySizedBoxPage();
        break;
      case 'FractionalTranslation':
        routeTo = FractionalTranslationPage();
        break;
      case 'LimitedBox':
        routeTo = LimitedBoxPage();
        break;
      case 'OverflowBox':
        routeTo = OverflowBoxPage();
        break;
      case 'ListView':
        routeTo = ListViewPage();
        break;
      case 'Scrollbar':
        routeTo = ScrollBarPage();
        break;
      case 'RefreshIndicator':
        routeTo = RefreshIndicatorPage();
        break;
      case 'Pointer(Absorb&Ignore)':
        routeTo = PointerPage();
        break;
      case 'Dismissible':
        routeTo = DismissiblePage();
        break;
      case 'Draggable':
        routeTo = DraggablePage();
        break;
      case 'DraggableScrollableSheet':
        routeTo = DraggableScrollableSheetPage();
        break;
      case 'GestureDetector':
        routeTo = GestureDetectorPage();
        break;
      case 'LifeCycle':
        routeTo = LifeCyclePage();
        break;
      case 'StatefulWidgetState':
        routeTo = StatefulWidgetStatePage();
        break;
      case 'MediaQuery':
        routeTo = MediaQueryPage();
        break;
      case 'Listener':
        routeTo = ListenerPage();
        break;
      case 'NotificationListener':
        routeTo = NotificationListenerPage();
        break;
      case 'Future&await':
        routeTo = FuturePage();
        break;

      default:
        Toast.show(
          "还没创建页面呢哦, 不要着急^ ^",
          context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.CENTER,
        );
    }

    if (null != routeTo) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (
            BuildContext context,
          ) {
            return routeTo;
          },
        ),
      );
    }
  }
}
