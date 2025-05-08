import 'package:flutter/material.dart';
import 'package:flutter_labs/features/auth/home/main_page.dart';
import 'package:flutter_labs/features/auth/singup_page.dart';
import 'package:flutter_labs/shared/component/my_textform.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var txtId = TextEditingController();
  var txtPwd = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>['email']);

  Future<void> login() async {
    final email = txtId.text;
    final password = txtPwd.text;
    final response = await Supabase.instance.client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("로그인 성공!")));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (ctx) => MainPage()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("로그인 실패: 아이디 또는 비밀번호가 틀렸습니다.")));
    }
  }

  //구글 로그인
  Future<void> _signInWithGoogle() async {
    try {
      // supabase 구글 로그인 안증
      await Supabase.instance.client.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: 'com.example.flutter_labs://login-callback',
      );

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("구글 로그인 성공!")));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (ctx) => MainPage()),
      );
    } catch (e) {
      print('로그인 오류: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("구글 로그인실패")));
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
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Spacer(),
                  Text(
                    "로그인",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 35),
                  MyTextform(txtController: txtId, title: "아이디"),
                  const SizedBox(height: 10),
                  MyTextform(txtController: txtPwd, title: "비밀번호"),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (ctx) => SingupPage()),
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
                      ElevatedButton(
                        onPressed: () {
                          _signInWithGoogle();
                        },
                        child: Image.asset(
                          "assets/icons/google.png",
                          width: 30,
                          height: 30,
                        ),
                      ),
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
                            SnackBar(
                              content: Text("로그인 실패: 아이디 또는 비밀번호를 확인하세요"),
                            ),
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
      ),
    );
  }
}
