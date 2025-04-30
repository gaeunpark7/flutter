import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(
      onPhoneShake: (ShakeEvent event) {
        print('Shake detected!');
        count++;
        setState(() {});
      },
      shakeThresholdGravity: 1.2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("플러터 만보기")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("흔들어주세요", style: TextStyle(fontSize: 24)),
              SizedBox(height: 20),
              Text("$count", style: TextStyle(fontSize: 40)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  count++;
                  setState(() {});
                },
                child: Text("뚜벅"),
              ),
              ElevatedButton(
                onPressed: () {
                  count = 0;
                  setState(() {});
                },
                child: Text("초기화"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
