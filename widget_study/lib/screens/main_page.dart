import 'package:flutter/material.dart';
import 'package:widget_study/provider/notifier/image_page.dart';
import 'package:widget_study/widget/appbar_page.dart';
import 'package:widget_study/widget/custom_scroll_view_page.dart';
import 'package:widget_study/widget/stack_page.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Row(
              children: [
                _buildButton(
                  buttonColor: Colors.amber,
                  textColor: Colors.white,
                  text: "appBar",
                  onTap: () {
                    context.pushNamed("appbar");
                  },
                ),
                _buildButton(
                  buttonColor: Colors.purple,
                  textColor: Colors.white,
                  text: "Stack/Align",
                  onTap: () {
                    context.pushNamed("stack");
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
                  onTap: () {
                    context.pushNamed("custom");
                  },
                ),
                _buildButton(
                  buttonColor: Colors.grey,
                  textColor: Colors.white,
                  text: "textFormField",
                  onTap: () {
                    context.pushNamed("textform");
                  },
                ),
              ],
            ),
            Row(
              children: [
                _buildButton(
                  buttonColor: Colors.greenAccent,
                  textColor: Colors.white,
                  text: "Dialog",
                  onTap: () {
                    context.pushNamed("dialog");
                  },
                ),
                _buildButton(
                  buttonColor: Colors.green,
                  textColor: Colors.white,
                  text: "GridView",
                  onTap: () {
                    context.pushNamed("gridview");
                  },
                ),
              ],
            ),
            Row(
              children: [
                _buildButton(
                  buttonColor: Colors.black,
                  textColor: Colors.white,
                  text: "BottomSheet",
                  onTap: () {
                    context.pushNamed("bottomsheet");
                  },
                ),
                _buildButton(
                  buttonColor: Colors.blue,
                  textColor: Colors.white,
                  text: "PageView",
                  onTap: () {
                    context.pushNamed("pageview");
                  },
                ),
              ],
            ),
            Row(
              children: [
                _buildButton(
                  buttonColor: const Color.fromARGB(255, 115, 12, 112),
                  textColor: Colors.white,
                  text: "StateNotifier",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => ImagePage()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
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
