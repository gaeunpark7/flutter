import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_study/screens/bottom_page.dart';
import 'package:widget_study/widget/appbar_page.dart';
import 'package:widget_study/widget/bottom_sheet_page.dart';
import 'package:widget_study/widget/custom_scroll_view_page.dart';
import 'package:widget_study/widget/dialog_page.dart';
import 'package:widget_study/widget/gridview_page.dart';
import 'package:widget_study/widget/page_view_page.dart';
import 'package:widget_study/widget/stack_page.dart';
import 'package:widget_study/widget/textformfield_page.dart';
import 'main.dart';

final router = GoRouter(
  initialLocation: '/bottom',
  routes: [
    GoRoute(
      path: "/bottom",
      name: "bottom",
      builder: (context, state) => BottomPage(),
    ),
    GoRoute(
      path: "/app-bar",
      name: "appbar",
      builder: (context, state) => AppbarPage(),
    ),
    GoRoute(
      path: "/stack",
      name: "stack",
      builder: (conetx, state) => StackPage(),
    ),
    GoRoute(
      path: "/custom-scroll-view",
      name: "custom",
      builder: (context, state) => CustomscrollviewPage(),
    ),
    GoRoute(
      path: "/text-form-field",
      name: "textform",
      builder: (context, state) => TextformfieldPage(),
    ),
    GoRoute(
      path: "/dialog",
      name: "dialog",
      builder: (context, state) => DialogPage(),
    ),
    GoRoute(
      path: "/gridView",
      name: "gridview",
      builder: (context, state) => GridviewPage(),
    ),
    GoRoute(
      path: "/bottomSheet",
      name: "bottomsheet",
      builder: (context, state) => BottomSheetPage(),
    ),
    GoRoute(
      path: "/pageView",
      name: "pageview",
      builder: (context, state) => PageViewPage(),
    ),
  ],
);
