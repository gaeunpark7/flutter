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
      //Scaffold 위에
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("tabBar demo"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          bottom: const TabBar(
            //appbar에 tabBar 넣음
            tabs: [
              Tab(icon: Icon(Icons.house)),
              Tab(text: '메뉴2'),
              Tab(icon: Icon(Icons.home), text: '메뉴3'),
            ],
          ),
        ),
        body: TabBarView(children: [
          //TabBarView를 body에
          Container(color: Colors.red),
          Container(color: Colors.orange),
          Container(color: Colors.yellow),
        ]), //label 필수
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
            BottomNavigationBarItem(icon: Icon(Icons.widgets), label: "위젯"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: "캘린더")
          ],
          onTap: (value) {
            print(value); //navigationbar 클릭했을 때 처리
          },
        ),
      ),
    );
  }
}
