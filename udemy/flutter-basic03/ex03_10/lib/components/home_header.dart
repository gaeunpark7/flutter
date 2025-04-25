import 'package:ex03_10/common/my_size.dart';
import 'package:ex03_10/components/home_header_main.dart';
import 'package:ex03_10/components/home_header_menu.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomeHeaderMenu(),
        HomeHeaderMain(),
      ],
    );
  }
}
