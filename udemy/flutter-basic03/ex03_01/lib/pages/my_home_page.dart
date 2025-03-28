import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: const Icon(Icons.menu),
        title: const Text("버거킹"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          const Icon(Icons.timer),
        ],
      ),
      body: const Column(
        children: [
          Text("메뉴판", style: TextStyle(fontSize: 24, fontFamily: "Nanum")),
          Icon(Icons.ac_unit),
          Text("전체메뉴"),
        ],
      ),
    ));
  }
}
