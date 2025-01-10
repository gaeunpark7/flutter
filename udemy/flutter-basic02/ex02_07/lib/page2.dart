import 'package:ex02_07/page1.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  int? userSn;

  Page2(this.userSn, {super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  // var userSn = 10; //유저 시리얼 넘버

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page2: 사용자${widget.userSn}")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Page2",
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const Page1()));
                },
                child: const Text("이전 페이지")),
          ],
        ),
      ),
    );
  }
}
