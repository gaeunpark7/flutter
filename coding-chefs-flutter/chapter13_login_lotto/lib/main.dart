import 'package:chapter13_login_app/layout.dart';
import 'package:flutter/material.dart';
import 'lottery_app.dart/lotto.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: const Lotto(),
    );
  }
}
