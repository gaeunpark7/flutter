import 'package:ex03_08/components/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _key = GlobalKey<FormState>();
  var txtId = TextEditingController();
  var txtPwd = TextEditingController();

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
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Form(
              key: _key,
              child: ListView(
                children: [
                  Spacer(),
                  const SizedBox(height: 10),
                  SvgPicture.asset("assets/svg/people.svg",
                      width: 80, height: 80),
                  const SizedBox(height: 10),
                  Text(
                    "회원마트",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  MyTextFormField(
                      controller: txtId, title: "아이디", hint: "아이디 또는 이메일 입력"),
                  const SizedBox(height: 10),
                  MyTextFormField(
                      controller: txtPwd,
                      title: "비밀번호",
                      isPassword: true,
                      length: 5),
                  const SizedBox(height: 10),
                  //로그인버튼
                  ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          print("56:ok");
                          print("71-id: ${txtId.text}, pwd: ${txtPwd.text}");
                        }
                        print("60:error");
                      },
                      child: Text("로그인")),
                  Spacer(),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
