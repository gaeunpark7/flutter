import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';

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

  void playSound(String name) {
    final AudioPlayer player = AudioPlayer();
    player.play(AssetSource('$name.wav'));
  }

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        playSound('bear');
                      },
                      child: Image.asset(
                        "images/bear.png",
                        height: 100,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child:
                          Container(width: 115, height: 2, color: Colors.blue),
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
                          Container(width: 115, height: 2, color: Colors.blue),
                    ),
                    const Text("Fox", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset("images/koala.png", height: 100),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child:
                          Container(width: 115, height: 2, color: Colors.green),
                    ),
                    const Text("Koala", style: TextStyle(fontSize: 20)),
                  ],
                ),
                Column(
                  children: [
                    Image.asset("images/camel.png", height: 100),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child:
                          Container(width: 115, height: 2, color: Colors.green),
                    ),
                    const Text("Camel", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset("images/lion.png", height: 100),
                    Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                            width: 115, height: 2, color: Colors.orange)),
                    const Text("Lion", style: TextStyle(fontSize: 20)),
                  ],
                ),
                Column(
                  children: [
                    Image.asset("images/tiger.png", height: 100),
                    Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                            width: 115, height: 2, color: Colors.orange)),
                    const Text("Tiger", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
