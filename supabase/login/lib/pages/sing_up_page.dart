import 'package:flutter/material.dart';
import 'package:login/component/textform.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  var txtName = TextEditingController();
  var txtId = TextEditingController();
  var txtPwd = TextEditingController();
  var txtPwd2 = TextEditingController();
  var formkey = GlobalKey<FormState>();

  Future<void> singup() async {
    try {
      final email = txtId.text;
      final password = txtPwd.text;

      final response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("회원가입 성공!")));
        Navigator.pop(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("회원가입에 실패했습니다. 오류: $e")));
    }
  }

  @override
  void dispose() {
    txtId.dispose();
    txtName.dispose();
    txtPwd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white),
        body: SingleChildScrollView(
          // padding: EdgeInsets.only(
          //   left: 20,
          //   right: 20,
          //   bottom: MediaQuery.of(context).viewInsets.bottom + 20, // 키보드 여백
          // ),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Text(
                  "회원가입",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                IconTextForm(Icon(Icons.face), txtName, "닉네임"),
                const SizedBox(height: 10),
                IconTextForm(Icon(Icons.email), txtId, "이메일"),
                const SizedBox(height: 10),
                IconTextForm(Icon(Icons.lock), txtPwd, "비밀번호"),
                const SizedBox(height: 10),
                IconTextForm(Icon(Icons.lock_open), txtPwd2, "비밀번호 확인"),
                const SizedBox(height: 40),
                SizedBox(
                  width: 400,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        if (txtPwd.text != txtPwd2.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("비밀번호가 서로 다릅니다.")),
                          );
                          return;
                        }
                        singup();
                      }
                    },
                    child: Text("회원가입"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconTextForm(Icon icon, TextEditingController txtController, String title) {
    return Row(
      children: [
        const SizedBox(width: 5),
        icon,
        Expanded(child: Textform(txtController: txtController, title: title)),
      ],
    );
  }
}
