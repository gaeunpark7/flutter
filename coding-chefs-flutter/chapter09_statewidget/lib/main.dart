import 'package:flutter/material.dart';

void main() {
  runApp(const MyPage());
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: const ParentWidget(),
    );
  }
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  int data = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Rebuilding Stateful Widget"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DataDisplay(data2: data),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  data += 1;
                });
              },
              child: const Text("Update Data"),
            ),
          ],
        ),
      ),
    );
  }
}

class DataDisplay extends StatefulWidget {
  final int data2;

  const DataDisplay({super.key, required this.data2});

  @override
  State<DataDisplay> createState() => _DataDisplayState();
}

class _DataDisplayState extends State<DataDisplay> {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Received Data: ${widget.data2}",
      style: const TextStyle(fontSize: 25, color: Colors.red),
    );
  }
}
