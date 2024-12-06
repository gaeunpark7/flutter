import 'package:flutter/material.dart';

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
  var tmStart = "00:00";
  var col = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("ex02-04"),
            backgroundColor: ThemeData().colorScheme.inversePrimary),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text("근무 시작시간: $tmStart"),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  print("66: Tab!!");
                  if (col == Colors.red) {
                    col = Colors.blue;
                  } else {
                    col = Colors.red;
                  }
                  setState(() {});
                },
                onLongPress: () {
                  print("69: LongPress!!");
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: col,
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  print("84: Text Clicked!!");
                },
                child: const SizedBox(
                  width: 50,
                  height: 50,
                  child: Text(
                    "클릭!!",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    var ret = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(), //현재시간
                    );
                    //시 분 표시, ret이 null이 아니면 hour, minute 반환.
                    print("48: ${ret?.hour ?? "00"}:${ret?.minute ?? "00"}");

                    tmStart =
                        "${convertTmString(ret?.hour ?? 0)}:${convertTmString(ret?.minute ?? 0)}";
                    print("53:$tmStart");
                  },
                  child: const Text("시간 선택")),
            ],
          ),
        ));
  }

  // 숫자를 입력 받아 2자리 문자로 반환
  convertTmString(int v) {
    String str = v.toString();
    //0123
    //007 => 1 ~ => (3 - 2)
    //0017 => 2 ~ => (4 - 2)
    str = "00$str"; //앞에 00을 붙여 최소 3자리 이상이 되게 만듬.
    str = str.substring(str.length - 2); //마지막 2자라만 추출
    print("62: $str");
    return str; //최종 결과 반환
  }
}
