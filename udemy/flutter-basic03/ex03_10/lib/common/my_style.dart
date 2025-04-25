import 'package:flutter/material.dart';

class MyStyle {
  static TextStyle h1() {
    return const TextStyle(fontSize: 64, fontWeight: FontWeight.bold);
  }

  static TextStyle h2() {
    return const TextStyle(fontSize: 64, fontWeight: FontWeight.bold);
  }

  static TextStyle h3() {
    return const TextStyle(fontSize: 64, fontWeight: FontWeight.bold);
  }

  static TextStyle h4({color = Colors.black}) {
    return TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle h5({color = Colors.black}) {
    return TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle h6({color = Colors.black}) {
    return TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle subtitle({color = Colors.black}) {
    return TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle body1({color = Colors.black87}) {
    return TextStyle(fontSize: 16, color: color);
  }

  static TextStyle body2({color = Colors.black87}) {
    return TextStyle(fontSize: 14, color: color);
  }
}
