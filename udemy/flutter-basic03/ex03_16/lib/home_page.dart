import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/services/predictive_back_event.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:shake/shake.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  late ShakeDetector detector;
  int count = 0;
  late ValueNotifier<double> valueNotifier;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    valueNotifier = ValueNotifier(0.0); //초기값

    super.initState();

    detector = ShakeDetector.autoStart(
      onPhoneShake: (ShakeEvent event) {
        print('Shake detected!');
        count++;
        valueNotifier.value = count.toDouble();
        setState(() {});
      },
      shakeThresholdGravity: 1.2,
    );
  }

  @override
  void dispose() {
    detector.stopListening();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("플러터 만보기"),
          backgroundColor: Colors.deepPurple,
        ),
        // body: Container(
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight,
        //       colors: [
        //         const Color.fromARGB(255, 195, 163, 255),
        //         const Color.fromARGB(255, 93, 28, 103),
        //       ],
        //     ),
        //   ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SimpleCircularProgressBar(
                size: MediaQuery.of(context).size.width * 0.8,
                maxValue: 3300,
                startAngle: 200,
                progressStrokeWidth: 13,
                backStrokeWidth: 10,
                progressColors: const [
                  Color.fromARGB(255, 112, 45, 174),
                  Colors.greenAccent,
                ],
                backColor: Colors.grey,
                animationDuration: 6,
                mergeMode: false,
                valueNotifier: valueNotifier,
                onGetText: (value) {
                  return Text("${value.toInt()}", style: centerTextStyle());
                },
              ),

              SizedBox(height: 50),
              Text("흔들어주세요", style: TextStyle(fontSize: 24)),
              SizedBox(height: 20),
              Text("$count", style: TextStyle(fontSize: 40)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      count++;
                      valueNotifier.value = count.toDouble();
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                    ),
                    child: Text("뚜벅"),
                  ),
                  Spacer(),

                  ElevatedButton(
                    onPressed: () {
                      count = 0;
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                    ),
                    child: Text("초기화"),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      detector.startListening();
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                    ),
                    child: Text("감지 시작"),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      detector.stopListening();
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                    ),
                    child: Text("감지 중지"),
                  ),
                  Spacer(),
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

  centerTextStyle() {
    return TextStyle(
      fontSize: 55,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }
}
