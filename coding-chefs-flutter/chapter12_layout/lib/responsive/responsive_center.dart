import 'package:flutter/material.dart';

class ResponsiveCenter extends StatelessWidget {
  const ResponsiveCenter({
    super.key,
    required this.maxCountenWidth,
    required this.padding,
    required this.child,
  });

  final double maxCountenWidth;
  final EdgeInsetsGeometry padding; //하위클래스 EdgeInsets
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: maxCountenWidth,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
