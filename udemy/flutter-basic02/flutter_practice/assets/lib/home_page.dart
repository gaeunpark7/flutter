import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.person_3_sharp),
            title: Text("홍길동"),
            trailing: Icon(Icons.back_hand),
          )
        ],
      ),
    );
  }
}
