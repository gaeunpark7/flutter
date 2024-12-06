import 'package:flutter/material.dart';

//버튼 변경 스크립트
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter-demo",
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _login = "로그인";
  final String _logout = "로그아웃";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("flutter demo"),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Center(
        child: Text(
          _login,
          style: const TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _lgoin_clicked,
        child: const Icon(Icons.login),
      ),
    );
  }

  void _lgoin_clicked() {
    setState(() {
      if (_login == '로그인') {
        _login = '로그아웃';
      } else {
        _login = '로그인';
      }
    });
  }
}
