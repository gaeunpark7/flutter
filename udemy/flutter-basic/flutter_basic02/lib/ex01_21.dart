import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("위치, 크기 조정"),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            color: Colors.red,
            width: 100,
            height: 100,
          ),
        ));
  }
}
