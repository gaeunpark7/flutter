import 'package:flutter/material.dart';

class TextformfieldPage extends StatefulWidget {
  const TextformfieldPage({super.key});

  @override
  State<TextformfieldPage> createState() => _TextformfieldPageState();
}

class _TextformfieldPageState extends State<TextformfieldPage> {
  var txtId = TextEditingController();
  var txtPwd = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var formkey2 = GlobalKey<FormState>();

  @override
  void dispose() {
    txtId.dispose();
    txtPwd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                "로그인",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: txtId,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "아이디를 입력하세요.";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "아이디",
                        hintText: "아이디 8자리를 입력하세요.",
                      ),
                      maxLength: 8,
                    ),
                    TextFormField(
                      controller: txtPwd,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "비밀번호를 입력하세요.";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "비밀번호",
                        hintText: "비밀번호 10자리를 입력하세요.",
                      ),
                      maxLength: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              FilledButton(
                style: FilledButton.styleFrom(
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueGrey,
                  fixedSize: Size(MediaQuery.of(context).size.width * 1, 48),
                ),
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${txtId.text}님 환영합니다.")),
                    );
                  }
                },
                child: Text("회원가입"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
