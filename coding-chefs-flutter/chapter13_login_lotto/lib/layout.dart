import 'package:chapter13_login_app/responsive/responsive_center.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'responsive/breakpoint.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: const ResponsiveCenter(
            maxCoutenWidth: Breakpoint.deskTop,
            padding: EdgeInsets.all(16),
            child: Login()));
  }
}
