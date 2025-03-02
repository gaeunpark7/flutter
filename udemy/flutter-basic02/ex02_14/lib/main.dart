import 'package:flutter/material.dart';
import 'dart:async';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
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
  int time = 0;
  late Timer timer;
  bool isRunning = false;

  List<String> lstLapTime = [];

  @override
  void initState() {
    //초기 실행
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel(); //타이머가 null이 아닐때 멈춤
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("스톱워치"), backgroundColor: Colors.blue),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("${time ~/ 100}", style: const TextStyle(fontSize: 25)),
                  const SizedBox(width: 5),
                  Text((time % 100).toString().padLeft(2, "0")),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: ListView(children: [
                // ...getRankList(), //스프레드 연산 추가
                ...lstLapTime.map((e) => Text(e, textAlign: TextAlign.center)),
              ])),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //초기화
                  ElevatedButton(
                      onPressed: () {
                        timerInit();
                      },
                      child: const Icon(Icons.refresh)),
                  //시작, 멈춤 버튼
                  ElevatedButton(
                    onPressed: () {
                      if (isRunning == true) {
                        timerPause();
                      } else {
                        timerStart();
                      }
                      isRunning =
                          !isRunning; //값을 반대로 변경해서 다음 클릭 시 반대 동작이 실행되게 함
                      // setState(() {});
                    },
                    // child: Text(isRunning ? "멈춤" : "시작")
                    child: Icon(isRunning ? Icons.pause : Icons.play_arrow),
                  ),
                  //런타임 버튼
                  ElevatedButton(
                      onPressed: () {
                        print(getLapTime());

                        // lstLapTime
                        //     .add("${lstLapTime.length + 1}등 ${getLapTime()}");
                        lstLapTime.insert(0,
                            "${lstLapTime.length + 1}등 ${getLapTime()}"); //최신걸 위로
                        print(lstLapTime);
                      },
                      child: const Icon(Icons.timer)),
                ],
              ),
            ],
          ),
        ));
  }

  //타이머 시작
  timerStart() {
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      time++;
      setState(() {
        print("33: ${time ~/ 100} . ${time % 100}");
      });
    });
  }

  timerPause() {
    timer.cancel();
  }

  //타이머 초기화
  timerInit() {
    time = 0;
    isRunning = false;
    timerPause();
    setState(() {});
    lstLapTime.clear(); //리스트 초기화 lsttLapTime = []
  }

  //타이머 기록
  getLapTime() {
    var ret = "";

    ret = "${time ~/ 100}. ${(time % 100).toString().padLeft(2, "0")}";

    return ret;
  }

  //순위를 텍스트로 표시
  getRankList() {
    List<Widget> ret = [];

    for (int i = 0; i < lstLapTime.length; i++) {
      ret.add(Text(
        lstLapTime[i],
        textAlign: TextAlign.center, //텍스트 정렬
      ));
    }
    return ret;
  }
}
