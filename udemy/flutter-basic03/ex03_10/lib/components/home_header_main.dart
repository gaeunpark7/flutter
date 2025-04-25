import 'package:ex03_10/common/my_size.dart';
import 'package:ex03_10/common/my_style.dart';
import 'package:ex03_10/common/my_text_form_feild.dart';
import 'package:flutter/material.dart';

class HomeHeaderMain extends StatefulWidget {
  const HomeHeaderMain({super.key});

  @override
  State<HomeHeaderMain> createState() => _HomeHeaderMainState();
}

class _HomeHeaderMainState extends State<HomeHeaderMain> {
  var txtArea = TextEditingController();
  var txtStartDate = TextEditingController();
  var txtEndDate = TextEditingController();
  var txtManCount = TextEditingController();
  var txtKidCount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MySize.header_height - 50,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/hotel6.jpeg"), fit: BoxFit.cover),
      ),
      child: _buildForm(),
    );
  }

  _buildForm() {
    return Align(
      alignment: const Alignment(0, 0),
      child: Container(
        color: Colors.white,
        width: 300,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            children: [
              buildTitle(),
              buildTextForm(),
            ],
          ),
        ),
      ),
    );
  }

  buildTitle() {
    return Row(
      children: [
        Text("132,000원", style: MyStyle.subtitle()),
        const SizedBox(width: 5),
        const Text("/박"),
        const Spacer(),
        const Text("★ 4.53 ",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        const Text(".후기 179개",
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
      ],
    );
  }

  buildTextForm() {
    return Form(
      child: Column(
        children: [
          MyTextFormField(controller: txtArea, title: "지역"),
          Row(
            children: [
              Expanded(
                  child:
                      MyTextFormField(controller: txtStartDate, title: "체크인")),
              Expanded(
                  child:
                      MyTextFormField(controller: txtEndDate, title: "체크아웃")),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: MyTextFormField(controller: txtManCount, title: "성인")),
              Expanded(
                  child: MyTextFormField(controller: txtKidCount, title: "이동")),
            ],
          ),
        ],
      ),
    );
  }
}
