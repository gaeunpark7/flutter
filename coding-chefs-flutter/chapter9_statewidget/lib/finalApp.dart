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
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: const MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int initialValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Final Variable"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Count(counter: initialValue), //Count 위젯의 생성자에 변수 값 전달
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  initialValue++;
                });
              },
              child: const Text("increase"),
            ),
          ],
        ),
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({super.key, required this.counter});
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Text("Counter: $counter",
        style: const TextStyle(fontSize: 25, color: Colors.red));
  }
}
