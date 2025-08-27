import 'package:go_router/go_router.dart';
import 'package:widget_study/screens/bottom_page.dart';
import 'package:widget_study/widget/appbar_page.dart';
import 'package:widget_study/widget/customScrollView_page.dart';
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
  ],
);
