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
    url: 'https://mcuuppefljrhselfqsyx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1jdXVwcGVmbGpyaHNlbGZxc3l4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDYxODQ4NjMsImV4cCI6MjA2MTc2MDg2M30.n7kKo-qX-J-Y2tNdN63dxNcAgvaPR9pJ-u_jt1sTp3E',
    // url: dotenv.env['URL']!,
    // anonKey: dotenv.env['KEY']!,
  );

  runApp(ProviderScope(child: MyApp()));
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
