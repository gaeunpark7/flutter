import 'package:flutter/material.dart';
import 'package:login/pages/home_page.dart';
import 'package:login/pages/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:app_links/app_links.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['URL']!,
    anonKey: dotenv.env['KEY']!,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppLinks appLinks = AppLinks();
  Session? session;

  @override
  void initState() {
    super.initState();
    session = Supabase.instance.client.auth.currentSession;
    _handleInitialLink();
    _listenToIncomingLinks();
  }

  Future<void> _handleInitialLink() async {
    final uri = await appLinks.getInitialLink();
    if (uri != null) {
      _handleLink(uri);
    }
  }

  void _listenToIncomingLinks() {
    appLinks.uriLinkStream.listen(
      (uri) {
        _handleLink(uri);
      },
      onError: (err) {
        print("딥링크 스트림 에러: $err");
      },
    );
  }

  Future<void> _handleLink(Uri uri) async {
    try {
      final res = await Supabase.instance.client.auth.getSessionFromUrl(uri);
      setState(() {
        session = res.session;
      });
    } catch (e) {
      print("링크 처리 실패: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: session != null ? HomePage() : LoginPage(),
    );
  }
}
