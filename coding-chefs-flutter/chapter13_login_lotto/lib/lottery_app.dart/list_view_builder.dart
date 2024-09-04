import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //1~100까지 index 값 만들어줌.
  final List<String> items = List.generate(100, (index) => "Item ${index + 1}");

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ListView.builder",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 86, 113, 135),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 8, 42, 73),
      body: ListView.separated(
        itemCount: items.length, //몇개의 항목을 표시할지
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(items[index]),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            //구분선
            color: Colors.grey,
            thickness: 0.5, //두께
          );
        },
      ),
    );
  }
}
