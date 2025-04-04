import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      primaryColor: Colors.white,
      appBarTheme: const AppBarTheme(
          // elevation: ,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 24),
          // color: Colors.black,
          iconTheme: IconThemeData(color: Colors.blue)));
}
