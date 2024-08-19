import 'package:chapter10_buttons_route/navigator.dart';
import 'package:flutter/material.dart';

class PageB extends StatelessWidget {
  const PageB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Page B"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: true,
          automaticallyImplyLeading: false, //뒤로 가기 버튼 생성 방지
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Page B screen", style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              FilledButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => const MyPage()));
                  },
                  child: const Text("Go to Home Page")),
            ],
          ),
        ));
  }
}
