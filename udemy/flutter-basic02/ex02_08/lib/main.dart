import 'package:ex02_08/User.dart';
import 'package:ex02_08/page1.dart';
import 'package:ex02_08/page2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home:  const MyHomePage(),
      initialRoute: MyHomePage.route,
      routes: {
        // 문자열로 페이지 전환환
        MyHomePage.route: (context) => const MyHomePage(),
        Page1.route: (context) => const Page1(),
        Page2.route: (context) => const Page2(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  static String route = "/";
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("라우팅 테스트")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  var user = User(sn: 12, name: "홍길동", age: 17);
                  var ret = await Navigator.pushNamed(context, Page1.route,
                      arguments: user);
                  print("59-page1 ret: $ret");
                },
                child: const Text("page 1")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Page2.route);
                },
                child: const Text("page 2"))
          ],
        ),
      ),
    );
  }
}
