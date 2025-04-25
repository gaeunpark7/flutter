import 'package:flutter/material.dart';

class MyTextFormField extends StatefulWidget {
  final String title;
  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final int length;
  const MyTextFormField(
      {super.key,
      required this.controller,
      required this.title,
      this.hint = "",
      this.isPassword = false,
      this.length = 20});

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 10),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        TextFormField(
          controller: widget.controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "${widget.title}을 입력해주세요";
            }
            return null;
          },
          decoration: InputDecoration(
              //기본
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              //눌렀을때
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black)),
              hintText: widget.hint,
              //에러가 발생했을 때
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.deepOrange))),
          obscureText: widget.isPassword,
          maxLength: widget.length,
        )
      ],
    );
  }
}
