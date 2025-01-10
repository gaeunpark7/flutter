import 'package:ex02_07/User.dart';
import 'package:ex02_07/page1.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  // int? userSn;
  User user;
  Page2(this.user, {super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  // var userSn = 10; //유저 시리얼 넘버
  var txtname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text("Page2: 사용자${widget.user}")
          title: const Text("Page2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("페이지 2"),
            Text("사용자 번호:${widget.user.sn}"),
            Text("사용자 이름:${widget.user.name}"),
            Text("니이: ${widget.user.age}"),
            const Text("새로운 이름: "),
            TextField(
              controller: txtname,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "변경 할 이름을 입력하세요"),
              onChanged: (value) {
                print("37 name: $value");
              },
            ),
            ElevatedButton(
                onPressed: () {
                  widget.user.name = txtname.text;
                  print("44 바뀐이름 :${widget.user.name}");
                },
                child: const Text("저장")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, widget.user); //반환값값
                },
                child: const Text("이전 페이지")),
          ],
        ),
      ),
    );
  }
}
