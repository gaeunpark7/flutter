import 'package:flutter/material.dart';

class Textform extends StatefulWidget {
  var txtController = TextEditingController();
  String title;
  Textform({super.key, required this.txtController, required this.title});

  @override
  State<Textform> createState() => _TextformState();
}

class _TextformState extends State<Textform> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "올바른 ${widget.title}를 입력하세요";
          }
          return null;
        },
        controller: widget.txtController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(10)
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 64, 175, 206),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red),
          ),
          hintText: widget.title,
        ),
      ),
    );
  }
}
