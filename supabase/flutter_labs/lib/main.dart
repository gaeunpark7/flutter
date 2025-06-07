import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_labs/features/board/main_page.dart';
import 'package:flutter_labs/features/auth/profile_page.dart';
import 'package:flutter_labs/features/auth/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: '',
    anonKey: '',
    // url: dotenv.env['URL']!,
    // anonKey: dotenv.env['KEY']!,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final session = Supabase.instance.client.auth.currentSession;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: session != null ? ProfilePage() : LoginPage(),
    );
  }
}
