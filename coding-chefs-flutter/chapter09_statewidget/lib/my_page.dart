import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key, required this.passedColor});
  final Color passedColor;

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  Color? color;
  @override
  void initState() {
    color = widget.passedColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          color = color == Colors.red ? Colors.blue : Colors.red;
        });
      },
      style: ElevatedButton.styleFrom(backgroundColor: color),
      child: const Icon(Icons.add, size: 80, color: Colors.white),
    );
  }
}
