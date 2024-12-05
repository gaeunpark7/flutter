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
      title: "flutter-practice",
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
  String _login = '로그인';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("flutter-demo"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FloatingActionButton(
        onPressed: _buttonclick,
        child: const Icon(Icons.add),
      ),
    );
  }
  void _buttonclick() {
    setState(() {
      if (_login == '로그인') {
        _login == "로그아웃";
      } else {
        _login = '로그인';
      }
    });
    print(_login);
  }
}
