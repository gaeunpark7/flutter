import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //디버그 배너 제거
      title: "Animal Sounds", //앱 이름
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: const AnimalSounds(),
    );
  }
}

class AnimalSounds extends StatelessWidget {
  const AnimalSounds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Animal Sounds"),
        centerTitle: true,
        leading: SizedBox(
          //앱바 좌측에 lottie 애니메이션 배치
          height: 50,
          width: 150,
          child: Lottie.asset(
              "lottie/cat.json"), //Image.asset 위젯과 같음. Lottie는 어도비 애프터 이팩트에서 애니메이션을 json형식으로 내보냄.
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "images/bear.png",
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child:
                          Container(width: 115, height: 2, color: Colors.green),
                    ),
                    const Text("Bear", style: TextStyle(fontSize: 20)),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "images/fox.png",
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child:
                          Container(width: 115, height: 2, color: Colors.green),
                    ),
                    const Text("Fox", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ],
            ),
          ),
          const Row(
            children: [
              Column(),
              Column(),
            ],
          ),
          const Row(
            children: [
              Column(),
              Column(),
            ],
          ),
        ],
      ),
    );
  }
}
