import 'package:ex03_01/components/food_list.dart';
import 'package:ex03_01/components/food_menu.dart';
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
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text("메뉴판", style: TextStyle(fontSize: 24, fontFamily: "Nanum")),
            SizedBox(height: 20),
            FoodList(),
          ],
        ),
      ),
    ));
  }
}
