import 'package:flutter/material.dart';
import 'package:login/pages/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EmailVerifyPage extends StatefulWidget {
  const EmailVerifyPage({super.key});

  @override
  State<EmailVerifyPage> createState() => _EmailVerifyPageState();
}

class _EmailVerifyPageState extends State<EmailVerifyPage> {
  Future<void> _checkEmailVerified(BuildContext context) async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user != null && user.emailConfirmedAt != null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => LoginPage()),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("아직 이메일 인증이 완료되지 않았어요.")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("email 인증", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            children: [
              Spacer(),
              const SizedBox(height: 50),
              Text('가입하신 이메일을 확인해주세요.', style: TextStyle(fontSize: 20)),
              Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    _checkEmailVerified(context);
                  },
                  child: Text("인증완료"),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
