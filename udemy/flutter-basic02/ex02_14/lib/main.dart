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
  // var timer = Timer.periodic( Duration(microseconds: 100), (timer){
  //   time ++;
  //   print("");
  // });

  @override
  void initState() {
    super.initState();

    // timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
    //   time++;
    //   print("33: $time");
    // });
  }

  @override
  void dispose() {
    timer.cancel(); //타이머가 null이 아닐때 멈춤
    super.dispose();
  }

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
                  Text("${time % 100}"),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: ListView(children: const [
                Text("1등: 12:34"),
                Text("2등: 11:11"),
                Text("3등 10:11"),
              ])),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text("초기화")),
                  ElevatedButton(
                      onPressed: () {
                        if (isRunning == true) {
                          timerPause();
                        } else {
                          timerStart();
                        }
                        isRunning = !isRunning;
                        // setState(() {});
                      },
                      child: Text(isRunning ? "멈춤" : "시작")),
                  ElevatedButton(onPressed: () {}, child: const Text("런타임")),
                ],
              ),
            ],
          ),
        ));
  }
}
