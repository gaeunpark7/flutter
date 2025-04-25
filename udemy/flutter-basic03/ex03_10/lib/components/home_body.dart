import 'package:ex03_10/common/my_size.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 2000,
      color: Colors.blue,
    );
  }
}
