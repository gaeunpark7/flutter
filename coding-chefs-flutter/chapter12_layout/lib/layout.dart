import 'package:flutter/material.dart';
import 'login.dart';
import 'responsive/breakpoint.dart';
import 'responsive/responsive_center.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: const ResponsiveCenter(
          maxCountenWidth: Breakpoint.deskTop,
          padding: EdgeInsets.all(16),
          child: Login()),
    );
  }
}
