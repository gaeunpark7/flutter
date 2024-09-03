import 'package:flutter/material.dart';

class ResponsiveCenter extends StatelessWidget {
  const ResponsiveCenter(
      {super.key,
      required this.maxCoutenWidth,
      required this.padding,
      required this.child});

  final double maxCoutenWidth;
  final EdgeInsetsGeometry padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: maxCoutenWidth,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
