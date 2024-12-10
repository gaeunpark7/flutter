import 'package:ex02_06/sliver_page.dart';
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
      title: 'Flutter Demo',
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
  double size = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("animation"), backgroundColor: Colors.blue[200]),
      body: Center(
          child: Column(
        children: [
          GestureDetector(
              onTap: () {
                size += 20;
                setState(() {});
              },
              child:
                  //얼마만큼 시간 동안 애니메이션을 실행하는가
                  AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: size,
                height: size,
                // curve: Curves.linear, 기본
                // curve: Curves.bounceIn, 바운스함
                // curve: Curves.easeInOut, 자연스럽고 부드러운 전환
                child: Image.asset(
                  "assets/꼬끼오곰.jpg",
                ),
              )),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const SliverPage()));
              },
              child: const Text("Sliver"))
        ],
      )),
    );
  }
}
