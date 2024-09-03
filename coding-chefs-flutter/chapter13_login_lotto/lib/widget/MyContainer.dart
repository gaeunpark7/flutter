import 'package:flutter/material.dart';

class Mycontainer extends StatelessWidget {
  const Mycontainer(
      {super.key,
      required this.width,
      required this.height,
      required this.backgroundColor,
      this.imagePath,
      required this.radius,
      this.icon});

  final double width;
  final double height;
  final Color? backgroundColor;
  final String? imagePath;
  final double radius;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        image: imagePath != null
            ? DecorationImage(image: AssetImage(imagePath!), fit: BoxFit.fill)
            : null,
      ),
      child: icon,
    );
  }
}
