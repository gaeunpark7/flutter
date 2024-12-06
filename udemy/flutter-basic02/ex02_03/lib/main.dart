import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      title: "flutter-demo",
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate, //Material 위젯 지역화 지원
        GlobalWidgetsLocalizations.delegate, //기본 위젯 지역화 지원
        GlobalCupertinoLocalizations.delegate, //iOS 스타일 지역화 지원
      ],
      // supportedLocales: const [
      //   Locale('ko', ''), //한국어
      //   Locale('en', ''), //영어
      // ],
      // locale: const Locale('ko', ''), //기본 언어를 한국어로 설정
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dialog"),
          backgroundColor: ThemeData().colorScheme.primary,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () async {
                    print("42번 버튼 클릭!"); //context: 현재페이지
                    var ret = await showDialog(
                      context: context,
                      barrierDismissible: false, // 버튼을 누르지 않았을 경우에 안 닫힘.
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("저장알림"),
                          content: const Text("현재의 데이터를 \n서버에 저장하시겠습니까?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop("저장"); //팝업 없앰.
                                },
                                child: const Text("저장")),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop("취소"); //팝업 없앰. return값
                                },
                                child: const Text("취소")),
                          ],
                        );
                      },
                    );
                    // ret.then((value){
                    // print("71 dialog 응닶값: $ret");
                    // });
                  },
                  child: const Text("저장")),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text("근무시작일"),
                ElevatedButton(
                    onPressed: () {
                      var ret = showDatePicker(
                        context: context,
                        locale: const Locale("ko", "KR"),
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2025),
                      );
                      print("95: $ret");

                      ret.then((value) {
                        print("96: 선택한 날짜 $value");
                      });
                    },
                    child: const Text("날짜 선택")),
              ],
            ),
          ],
        ));
  }
}
