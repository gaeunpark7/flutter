import 'package:flutter/material.dart';
import 'package:flutter_basic02/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo',
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
        title: const Text("Container Demo"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: const Text("문자열"),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.green,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: const Text("문자열"),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: const Text("문자열"),
          ),
        ],
      ),
    );
  }
}
