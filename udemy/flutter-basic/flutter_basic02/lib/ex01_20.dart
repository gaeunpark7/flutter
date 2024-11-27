import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // var items = List.generate(100, (index) => index);

  const MyHomePage({super.key}); // 0~99

  // MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("tabBar demo"),
            // bottom: (),
          ),
          body: TabBarView(children: [
            Container(color: Colors.red),
            Container(color: Colors.orange),
            Container(color: Colors.yellow),
          ]),
        ));
  }
}
