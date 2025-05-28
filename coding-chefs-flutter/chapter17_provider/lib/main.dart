import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chapter17_provider/fish_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (ctx) => Salmon(fishName: 'Salmon', fishNumber: 10, fishSize: 'big'),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: FishOrder(),
      ),
    );
  }
}

class FishOrder extends StatefulWidget {
  const FishOrder({super.key});

  @override
  State<FishOrder> createState() => _FishOrderState();
}

class _FishOrderState extends State<FishOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Fish Order"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Fish name: ${Provider.of<Salmon>(context).fishName}",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            High(),
          ],
        ),
      ),
    );
  }
}

class High extends StatelessWidget {
  const High({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "SpicyA is located at high place",
          style: TextStyle(fontSize: 16),
        ), //매운탕 가게의 위치 출력
        SizedBox(height: 20),
        SpicyA(),
      ],
    );
  }
}

class SpicyA extends StatelessWidget {
  const SpicyA({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Fish number: ${Provider.of<Salmon>(context).fishNumber}",
          style: TextStyle(
            fontSize: 16,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ), //주문할 생선 개수
        Text(
          "Fish size: ${Provider.of<Salmon>(context).fishSize}", //주문할 생선 사이즈
          style: TextStyle(
            fontSize: 16,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        Middle(),
      ],
    );
  }
}

class Middle extends StatelessWidget {
  const Middle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "SicyB is located at middle place",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 20),
        SpicyB(),
      ],
    );
  }
}

class SpicyB extends StatelessWidget {
  const SpicyB({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Fish number",
          style: TextStyle(
            fontSize: 16,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Fish size",
          style: TextStyle(
            fontSize: 16,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Provider.of<Salmon>(context, listen: false).changeFishNumber();
          },
          child: Text("Change fish number"),
        ),
      ],
    );
  }
}
