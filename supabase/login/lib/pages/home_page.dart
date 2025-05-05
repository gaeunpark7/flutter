import 'package:flutter/material.dart';
import 'package:login/pages/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                logout(context);
              },
              child: Text(
                "로그아웃",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void logout(BuildContext context) async {
  try {
    await Supabase.instance.client.auth.signOut();

    // 로그인 페이지 외 모든 화면 제거
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => LoginPage()),
      (route) => false,
    );
  } catch (e) {
    print('로그아웃 실패: $e');
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("로그아웃에 실패했어요.")));
  }
}
