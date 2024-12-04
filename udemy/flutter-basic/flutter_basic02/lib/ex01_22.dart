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
      debugShowCheckedModeBanner: false,
      home: const MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("위치, 크기 조정"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: const Center(
        child: CircleAvatar(
          // child: Icon(Icons.mouse),
          backgroundImage: ExactAssetImage('assets/london.jpg'),
          backgroundColor: Colors.white, //투명하게
        ),
      ),
    );
  }
}
