import 'package:flutter/material.dart';
import 'prod/prod_view.dart';

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
  var prodNo = "01";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("hero"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: GestureDetector(
        onTap: () {
          print("1: 발리여행 클릭");
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => const ProdView()));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              color: Colors.grey[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Hero(
                        tag: "prod01",
                        child: Image.asset(
                          "assets/bali.jpg",
                          width: 100,
                          height: 100,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        children: [
                          Text("발리 여행 패키지", style: TextStyle(fontSize: 18)),
                          Text("(주) 농담곰사랑 여행사 ",
                              style: TextStyle(fontSize: 13)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
