import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: const MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  TextEditingController txtId = TextEditingController();
  var txtPwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("practice"), backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: txtId,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "아이디룰 입력하세요"),
              onChanged: (value) => print("id: $value"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: txtPwd,
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "비밀번호를 입력하세요"),
              onChanged: (value) {
                print("pws: $value");
              },
            ),
            ElevatedButton(
                onPressed: () {
                  var strId = txtId.text;
                  var strPwd = txtPwd.text;
                },
                child: const Text("로그인")),
          ],
        ),
      ),
    );
  }
}
