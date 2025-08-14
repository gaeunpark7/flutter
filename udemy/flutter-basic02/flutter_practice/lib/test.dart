import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  final List<String> items = List.generate(100, (index) => "item ${index + 1}");
  Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: [Text(items[index])],
              ),
            );
          }),
    );
  }
}
