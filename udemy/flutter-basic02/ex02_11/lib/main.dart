import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
  var txtId = TextEditingController();
  var txtPwd = TextEditingController();

  var formkey = GlobalKey<FormState>();
  var formkey2 = GlobalKey<FormState>();

//TextEdting 컨트롤러 해제(해줘야함)
  @override
  void dispose() {
    txtId.dispose();
    txtPwd.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextField 예제"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              key: formkey, //키키
              child: Column(
                children: [
                  //아이디 텍스트 필드드
                  TextFormField(
                    controller: txtId,
                    //유효성 검사
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "아이디를 입력하세요";
                      }
                      return null; // 둘다 아니면 아무것도 반환하지 않음.
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "아이디",
                        hintText: "5글자이내로 입력하세요."),
                    maxLength: 5, //문자 갯수 지정
                  ),
                  const SizedBox(height: 10),
                  //비밀번호 텍스트 필드
                  TextFormField(
                    controller: txtPwd,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "암호를 입력하세요";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "비밀번호"),
                    obscureText: true,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print("51-id ${txtId.text}");
                      print("61-id ${txtPwd.text}");

                      //validator호출
                      if (formkey.currentState!.validate()) {
                        print("144: 서버로 로그인 요청 ${txtId.text}-${txtPwd.text}");

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("로그인 완료되었습니다.")));
                      }
                    },
                    child: const Text("클릭"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
