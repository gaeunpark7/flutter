import 'package:flutter/material.dart';

class MyTextform extends StatefulWidget {
  var txtController = TextEditingController();
  String title;
  int? maxLength;
  MyTextform({
    super.key,
    required this.txtController,
    required this.title,
    this.maxLength,
  });

  @override
  State<MyTextform> createState() => _MyTextformState();
}

class _MyTextformState extends State<MyTextform> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      maxLength: widget.maxLength,
    );
  }
}
