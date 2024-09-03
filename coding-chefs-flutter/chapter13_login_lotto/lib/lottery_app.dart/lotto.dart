import 'package:flutter/material.dart';
import 'dart:math';

class Lotto extends StatefulWidget {
  const Lotto({super.key});

  @override
  State<Lotto> createState() => _LottoState();
}

class _LottoState extends State<Lotto> {
  //생성 될 로또 번호를 담을 변수, List안에는 List<int>타입의 데이터만 담길 수 있음.
  List<List<int>> listLottery = [];

  void _createNumber() {
    setState(() {
      //로또 번호 생성 로직 구현
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("lotto app"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("This is a loto page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
