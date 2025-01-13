import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  static String route = "/page2";
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("page 2")),
      body: Center(
        child: Column(
          children: [
            const Text("page 2"),
            ElevatedButton(onPressed: () {}, child: const Text("page 3")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/");
                },
                child: const Text("go back!!")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/", (route) => false);
                  Navigator.pushNamed(context, Page2.route); //지우고 쌓음..
                },
                child: const Text("go home")),
          ],
        ),
      ),
    );
  }
}
