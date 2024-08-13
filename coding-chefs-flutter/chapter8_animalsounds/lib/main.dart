import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animal Sounds",
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
      ),
    );
  }
}
