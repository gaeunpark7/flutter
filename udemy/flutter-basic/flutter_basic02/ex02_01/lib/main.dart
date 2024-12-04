import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var _id = "";
  // var _password = "";

  TextEditingController txtId = TextEditingController();
  var txtPwd = TextEditingController();

  bool? isSaveId = false; //id 저장

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "입력 필드 테스트",
      )),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: txtId,
              //힌트
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "아이디를 입력해주세요"),
              onChanged: (value) {
                print("46 아이디: $value");
                // _id = value; //아이디가 변경 될때마다 변수에 넣어줌
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: txtPwd,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "비밀번호를 입력해주세요"),
              obscureText: true, //비밀번호 안 보이게
              onChanged: (value) {
                print("55-암호: $value");
                // _password = value;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  var strId = txtId.text;
                  var strPwd = txtPwd.text;
                  // print("62:아이디: $_id 암호$_password"); //this 안써도 됨.
                  print("70:아이디:$strId 암호$strPwd");
                },
                child: const Text("로그인")),
            Checkbox(
                value: isSaveId,
                onChanged: (value) {
                  // print("86-checkout box: $value");

                  setState(() {
                    //상태관리(화면 다시 그려라. 권장사항 x 저용자일때만 . .)
                    isSaveId = value;
                    print("88-isSaveId: $isSaveId");
                  });
                }),
            Switch(
                value: isSaveId ?? false,
                onChanged: (a) {
                  isSaveId = a;
                  setState(() {});
                }),
            Text(isSaveId! ? "On" : "Off"),
          ],
        ),
      ),
    );
  }
}
