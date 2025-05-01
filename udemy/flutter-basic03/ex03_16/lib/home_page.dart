import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/services/predictive_back_event.dart';
import 'package:shake/shake.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  late ShakeDetector detector;
  int count = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    super.initState();

    detector = ShakeDetector.waitForStart(
      onPhoneShake: (ShakeEvent event) {
        print('Shake detected!');
        count++;
        setState(() {});
      },
      shakeThresholdGravity: 1.2,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
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
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  count = 0;
                  setState(() {});
                },
                child: Text("초기화"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      detector.startListening();
                      setState(() {});
                    },
                    child: Text("만보기 실행"),
                  ),
                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () {
                      detector.stopListening();
                      setState(() {});
                    },
                    child: Text("만보기 중지"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("105 - didChangeAppLifecyceState: $state");
    switch (state) {
      //일시정지
      case AppLifecycleState.paused:
        detector.stopListening();
        break;

      //재활성화
      case AppLifecycleState.resumed:
        detector.startListening();
        break;

      default:
        break;
    }
  }
}
