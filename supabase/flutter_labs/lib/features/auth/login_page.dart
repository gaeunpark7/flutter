import 'package:flutter/material.dart';
import 'package:flutter_labs/features/board/main_page.dart';
import 'package:flutter_labs/features/auth/profile_page.dart';
import 'package:flutter_labs/features/auth/singup_page.dart';
import 'package:flutter_labs/shared/component/my_textform.dart';
// import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
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
    try {
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
      }
    } catch (e) {
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
        redirectTo: 'com.example.flutterlabs://login-callback',
      );

      // 2. 로그인 후 상태 변화 감지 (signInWithOAuth는 리다이렉트 방식이라 직접 체크보다 이게 안전)
      Supabase.instance.client.auth.onAuthStateChange.listen((data) async {
        final event = data.event;
        final session = data.session;

        if (event == AuthChangeEvent.signedIn && session != null) {
          final user = session.user;
          // // 로그인 성공 후 유저 정보 가져오기
          // final user = Supabase.instance.client.auth.currentUser;

          // if (user == null) {
          //   ScaffoldMessenger.of(
          //     context,
          //   ).showSnackBar(SnackBar(content: Text("유저 정보를 불러올 수 없습니다.")));
          //   return;
          // }
          // users 테이블에서 유저 존재 확인
          final existingUser =
              await Supabase.instance.client
                  .from('users')
                  .select()
                  .eq('id', user.id)
                  .maybeSingle();

          if (existingUser == null) {
            // 없으면 users 테이블에 등록
            await Supabase.instance.client.from('users').insert({
              'id': user.id,
              'email': user.email,
            });

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (ctx) => ProfilePage()),
            );
          } else {
            //있으면 메인 페이지
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (ctx) => MainPage()),
            );
          }
        }
      });
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
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    // Spacer(),
                    const SizedBox(height: 30),
                    Text(
                      "로그인",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 35),
                    MyTextform(txtController: txtId, title: "아이디"),
                    const SizedBox(height: 10),
                    MyTextform(txtController: txtPwd, title: "비밀번호"),
                    SizedBox(height: 25),
                    Row(
                      children: [
                        // Spacer(),
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
                      ],
                    ),
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
