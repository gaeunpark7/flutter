import 'package:ex03_10/common/my_style.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatefulWidget {
  final String title;
  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final List<double> borders;
  final List<double> borderSide;

  // final int length;
  const MyTextFormField(
      {super.key,
      required this.controller,
      required this.title,
      this.hint = "",
      this.isPassword = false,
      this.borders = const [10.0, 10.0, 10.0, 10.0],
      this.borderSide = const [1, 1, 1, 1]}); //l t r b

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(widget.borders[0]),
                  topRight: Radius.circular(widget.borders[1]),
                  bottomLeft: Radius.circular(widget.borders[2]),
                  bottomRight: Radius.circular(widget.borders[3])),
              border: Border(
                  left: BorderSide(
                      width: widget.borderSide[0], color: Colors.black45),
                  right: BorderSide(
                      width: widget.borderSide[2], color: Colors.black45),
                  top: BorderSide(
                      width: widget.borderSide[1], color: Colors.black45),
                  bottom: BorderSide(
                      width: widget.borderSide[3], color: Colors.black45))),
          child: TextFormField(
            controller: widget.controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "${widget.title}을 입력해주세요";
              }
              return null;
            },
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(top: 30, left: 20, bottom: 10),

              border: InputBorder.none,
              //기본
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(widget.borders[0]),
              //       topRight: Radius.circular(widget.borders[1]),
              //       bottomLeft: Radius.circular(widget.borders[2]),
              //       bottomRight: Radius.circular(widget.borders[3])),
              // ),
              // //눌렀을때
              // focusedBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(widget.borders[0]),
              //         topRight: Radius.circular(widget.borders[1]),
              //         bottomLeft: Radius.circular(widget.borders[2]),
              //         bottomRight: Radius.circular(widget.borders[3])),
              //     borderSide: const BorderSide(color: Colors.black)),
              // hintText: widget.hint,
              // //에러가 발생했을 때
              // focusedErrorBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(widget.borders[0]),
              //         topRight: Radius.circular(widget.borders[1]),
              //         bottomLeft: Radius.circular(widget.borders[2]),
              //         bottomRight: Radius.circular(widget.borders[3])),
              //     borderSide: const BorderSide(color: Colors.deepOrange)),
              hintText: widget.hint,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            obscureText: widget.isPassword,
          ),
        ),
        Positioned(
          left: 10,
          top: 5,
          child: Text(
            widget.title,
            style: MyStyle.formFieldTitle(),
          ),
        ),
      ],
    );
  }
}
