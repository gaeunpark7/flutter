import 'package:ex02_07/User.dart';
import 'package:ex02_07/page2.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  var userSn = 10;

  var user = User(sn: 11, name: "홍길동", age: 27);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page1")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Page 1",
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                  onPressed: () async {
                    User ret = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => Page2(user),
                        ));
                    print("48-page1 return: $ret");
                    //async를 사용하면 user값 반환을 할 수 있음. 그냥 뒤로가기는 null값 반환.
                    print("52:${ret.name}");
                  },
                  child: const Text("Page 2")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("이전 페이지"))
            ],
          ),
        ),
      ),
    );
  }
}
