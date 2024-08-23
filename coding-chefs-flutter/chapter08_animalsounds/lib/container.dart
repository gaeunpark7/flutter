import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyContainer(),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        //안전하게 앱 스크린 내에서 모든 ui요소들이 그려지도록 도와줌.
        child: Container(
          width: 150,
          height: 150,
          color: Colors.red,
          margin: const EdgeInsets.only(top: 50, left: 50),
          child: const Text("Hello Flutter!"),
        ),
      ),
    );
  }
}
