import 'package:chapter13_login_app/layout.dart';
import 'package:flutter/material.dart';
import 'lottery_app.dart/lotto.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: const Lotto(),
    );
  }
}
