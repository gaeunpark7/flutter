import 'package:ex03_10/components/home_body.dart';
import 'package:ex03_10/components/home_header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(children: const [
          HomeHeader(),
          HomeBody(),
        ]),
      ),
    );
  }
}
