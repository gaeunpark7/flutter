import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: const MyColumn(),
    );
  }
}

class MyColumn extends StatelessWidget {
  const MyColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text("MyColumn"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end, //세로정렬
        crossAxisAlignment: CrossAxisAlignment.end, //가로 정렬
        children: [
          //세 개의 Container위젯 배치
          Container(
            width: 150,
            height: 150,
            color: Colors.red,
          ),
          Container(
            width: 150,
            height: 150,
            color: Colors.yellow,
          ),
          Container(
            width: 150,
            height: 150,
            color: Colors.blue,
          ),
          Container(
            width: double.infinity, //무한대(처음~끝)
          )
        ],
      ),
    );
  }
}
