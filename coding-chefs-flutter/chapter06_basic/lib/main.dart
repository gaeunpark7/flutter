import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); //const키워드는 다시 생성하지 않고, 계속 재사용할수 있음.
}

class MyApp extends StatelessWidget {
  //stl만 입력하면 flutter에서 자동으로 StatlessWidget생성해줌.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //모든 위젯은 반드시 build()메서드를 거침.
    return MaterialApp(
      //Material desing을 적용하는데 필요한 기본 위젯, 테마,스타일을 사용할 수 있게 해줌.
      theme: ThemeData(
          //앱에서 사용되는 색상,글꼴,그림자, 텍스트 스타일..다양한 디자인 속성 정의
          colorSchemeSeed: Colors.blue //color: 개발자가 신경쓰지않아도, ui컬러를 조화롭게 지정
          ),
      home: const MyPage(), //home: 앱의 초기화면 지정
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //앱 화면에 다양한 컴포넌트를 배치하고 그릴 수 있도록 도와줌.
        appBar: AppBar(
          title: const Text("My first app"),
          backgroundColor: Theme.of(context)
              .colorScheme
              .inversePrimary, //위젯 트리에서 거슬러 올라가며 가장 가까운 상위 테마 데이터 접근
        ),
        body: const Center(
          child: Text("Hello"),
        ));
  }
}
