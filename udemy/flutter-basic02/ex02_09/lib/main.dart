import 'package:ex02_09/GB.dart';
import 'package:ex02_09/page1.dart';
import 'package:ex02_09/page2.dart';
import 'package:ex02_09/page3..dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple, // AppBar 색상
        ),
        // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        //   backgroundColor:
        //       Color.fromARGB(255, 98, 0, 255), // BottomNavigationBar 색상
        // ),
      ),
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
  int _selectIndex = 0;

  var pages = [const Page1(), const Page2(), const Page3()];

  @override
  void initState() {
    super.initState();
    _selectIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "농담곰 쇼핑몰",
          style: TextStyle(color: GB.mainColor),
        ),
        centerTitle: true,
        leading: IconButton(
            //왼쪽
            onPressed: () {
              print("메뉴 클릭!");
            },
            icon: Icon(
              Icons.menu,
              color: GB.mainColor,
            )),
        //오른쪽
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list_alt)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: pages[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "쇼핑"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "카트"),
        ],
        selectedItemColor: Colors.purple, // 선택된 항목 아이콘 색상
        unselectedItemColor: Colors.grey, // 선택되지 않은 항목 아이콘 색상
        showUnselectedLabels: true,

        onTap: (index) {
          print("42 $index");
          setState(() {
            _selectIndex = index;
          });
        },
        currentIndex: _selectIndex,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
