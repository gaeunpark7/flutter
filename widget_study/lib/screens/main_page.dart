import 'package:flutter/material.dart';
import 'package:widget_study/widget/appbar_page.dart';
import 'package:widget_study/widget/stack_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              _buildButton(
                buttonColor: Colors.amber,
                textColor: Colors.white,
                text: "appBar",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (ctx) => AppbarPage()),
                  );
                },
              ),
              _buildButton(
                buttonColor: Colors.purple,
                textColor: Colors.white,
                text: "Stack/Align",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (ctx) => StackPage()),
                  );
                },
              ),
            ],
          ),
          Row(
            children: [
              _buildButton(
                buttonColor: Colors.blueAccent,
                textColor: Colors.white,
                text: "CustomScrollView",
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _buildButton extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final String text;
  final VoidCallback onTap;

  const _buildButton({
    required this.buttonColor,
    required this.textColor,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        foregroundColor: textColor,
        fixedSize: Size(200, 30),
        elevation: 0,
      ),
      onPressed: onTap,
      child: Text(text),
    );
  }
}
