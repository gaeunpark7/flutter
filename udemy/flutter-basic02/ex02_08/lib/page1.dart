import 'package:ex02_08/User.dart';
import 'package:ex02_08/page2.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  static String route = "/page1";

  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  void initState() {
    super.initState();
    print("18: initState()");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("32: did");
    //main에서 user 정보 가져오기. null이 아닐때? 불러오기
    var user = ModalRoute.of(context)?.settings.arguments as User;
    print("19: ${user.sn}");
    print("20: ${user.name}");
    print("21: ${user.age}");
  }

//창이 닫힐 때 호출 page1 닫으면 호출됨.
  @override
  void dispose() {
    print("37: dispose()");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("page 1")),
      body: Center(
        child: Column(
          children: [
            const Text("페이지 #1"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Page2.route);
                },
                child: const Text("page 2")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, "결과 값");
                },
                child: const Text("Go back!!")),
            ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text("Redraw!"))
          ],
        ),
      ),
    );
  }
}
