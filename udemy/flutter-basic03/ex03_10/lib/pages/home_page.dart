import 'package:ex03_10/common/my_size.dart';
import 'package:ex03_10/components/home_body.dart';
import 'package:ex03_10/components/home_header.dart';
import 'package:ex03_10/components/home_mid_title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size; //앱 실행할때 화면 크기 저장.
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          const HomeHeader(),
          SizedBox(height: MySize.size_m),
          const HomeMidTitle(),
          SizedBox(height: MySize.size_m),
          const HomeBody(),
        ]),
      ),
    );
  }
}
