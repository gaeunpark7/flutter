import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Character(),
    );
  }
}

class Character extends StatelessWidget {
  const Character({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[800],
      appBar: AppBar(
        title: const Text("BRNTO ID CARD"),
        backgroundColor: Colors.amber[700],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //가로축 정렬 속성
          children: [
            Center(
              child: Image.asset(
                "images/ch1.png",
                width: 220,
                height: 150,
              ),
            ),
            Divider(
              //밑줄
              height: 40, //위로 20, 아래로 20
              color: Colors.grey[850],
              thickness: 0.5, //두께
            ),
            const Text(
              "NAME",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0, //철자 간격을 2.0으로 지정
              ),
            ),
            SizedBox(
              height: 10.0, //세로방향으로 10.0만큼의 공간확보
            ),
            const Text(
              "BBANTO",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            const Text(
              "BBANTO POWER LEVEL",
              style: TextStyle(color: Colors.white, letterSpacing: 2.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            const Text(
              "10",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            const Row(
              //자식 위젯들을 가로로 배치
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Using lightsaber",
                  style: TextStyle(letterSpacing: 1.0),
                ),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            const Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Hero face tatto",
                  style: TextStyle(fontSize: 16.0, letterSpacing: 1.0),
                ),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            const Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Fire flames",
                  style: TextStyle(fontSize: 16.0, letterSpacing: 1.0),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: const AssetImage("images/ch2.png"),
                backgroundColor: Colors.amber[800],
                radius: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}
