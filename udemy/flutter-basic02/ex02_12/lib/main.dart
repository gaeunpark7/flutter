import 'package:ex02_12/bmi_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      debugShowCheckedModeBanner: false,
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
  var txtId = TextEditingController();
  var txtPwd = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    txtId.dispose();
    txtPwd.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TextFormField")),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    enabled: false, //알맞은 이메일을 입력했을 때 변경 x
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "이메일을 입력해주세요";
                      }
                      // if (!value.contains("@")) {
                      //   return "이메일 형식이 올바르지 않습니다.";
                      // }
                      var emailExp =
                          RegExp(r"^[^@]+@[^@]+\.[^@]+"); //flutter regex email
                      if (!emailExp.hasMatch(value)) {
                        return "이메일 형식이 올바르지 않습니다.";
                      }

                      return null;
                    },
                    controller: txtId,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        //이메일을 입력했을 때
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        //기본 컬러러
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        //다른 곳을 클릭하였을 때 테두리 색상
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        //눌렀을 때 테두리 색상
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        icon: Icon(Icons.email),
                        labelText: "이메일",
                        hintText: "이메일을 입력하세요",
                        hintStyle: TextStyle(fontStyle: FontStyle.italic)),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "암호를 입력해주세요요";
                      }
                      return null;
                    },
                    controller: txtPwd,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.lock_outline),
                        labelText: "비밀번호",
                        hintText: "비밀번호를 입력하세요",
                        hintStyle: TextStyle(fontStyle: FontStyle.italic)),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      //버튼 넓이이
                      width: 150,
                      child: ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              print("로그인을 시도합니다.");
                            }
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => const BmiPage()));
                          },
                          child: const Text("로그인"))),
                ],
              ))),
    );
  }
}
