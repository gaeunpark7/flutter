import 'package:flutter/material.dart';
import 'package:login/component/textform.dart';
import 'package:login/pages/sing_up_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var txtId = TextEditingController();
  var txtPwd = TextEditingController();
  final formkey = GlobalKey<FormState>();

  //로그인
  Future<void> login() async {
    final email = txtId.text;
    final password = txtPwd.text;

    final response = await Supabase.instance.client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user != null) {
      print('로그인 성공!');
    } else {
      print('로그인 실패!');
    }
  }

  @override
  void dispose() {
    super.dispose();
    txtId.dispose();
    txtPwd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Spacer(),
                Text(
                  "로그인",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 35),
                Textform(txtController: txtId, title: "아이디"),
                const SizedBox(height: 10),
                Textform(txtController: txtPwd, title: "비밀번호"),
                SizedBox(height: 25),
                Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (ctx) => SingUpPage()),
                        );
                      },
                      child: Text(
                        "회원가입",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text("|"),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "비밀번호 찾기",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  width: 380,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        login();
                        // print("id:$txtId pwd:$txtPwd");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("로그인 실패: 아이디 또는 비밀번호를 확인하세요")),
                        );
                      }
                      return;
                    },
                    child: Text(
                      "로그인",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
