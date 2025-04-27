import 'package:ex03_10/common/my_size.dart';
import 'package:ex03_10/common/my_style.dart';
import 'package:ex03_10/common/my_text_form_field.dart';
import 'package:flutter/material.dart';

class HomeHeaderMain extends StatefulWidget {
  const HomeHeaderMain({super.key});

  @override
  State<HomeHeaderMain> createState() => _HomeHeaderMainState();
}

class _HomeHeaderMainState extends State<HomeHeaderMain> {
  final _key = GlobalKey<FormState>();
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
      alignment: MediaQuery.of(context).size.width > 480
          ? const Alignment(0, 0)
          : const Alignment(0, 0),
      child: Container(
        color: Colors.white,
        width: 300,
        height: 350,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            children: [
              buildTitle(),
              SizedBox(height: MySize.size_m),
              buildTextForm(),
              SizedBox(height: MySize.size_m),
              _buildButton()
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
      key: _key,
      child: Column(
        children: [
          MyTextFormField(
            controller: txtArea,
            title: "지역",
            hint: "원하시는 지역을 입력해주세요.",
            borders: const [10, 10, 0, 0],
            borderSide: const [1, 1, 1, 1],
          ),
          Row(
            children: [
              Expanded(
                  child: MyTextFormField(
                controller: txtStartDate,
                title: "체크인",
                hint: "2025.06.02",
                borders: const [0, 0, 0, 0],
                borderSide: const [1, 0, 1, 0],
              )),
              Expanded(
                  child: MyTextFormField(
                controller: txtEndDate,
                title: "체크아웃",
                hint: "2025.06.30",
                borders: const [0, 0, 0, 0],
                borderSide: const [0, 0, 1, 0],
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: MyTextFormField(
                controller: txtManCount,
                title: "성인",
                hint: "2",
                borders: const [0, 0, 10, 0],
                borderSide: const [1, 1, 1, 1],
              )),
              Expanded(
                  child: MyTextFormField(
                controller: txtKidCount,
                title: "아동",
                hint: "아동",
                borders: const [0, 0, 0, 10],
                borderSide: const [1, 1, 1, 1],
              )),
            ],
          ),
        ],
      ),
    );
  }

  _buildButton() {
    return SizedBox(
      width: 280,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          if (_key.currentState!.validate()) {
            print("135:지역 ${txtArea.text}");
            print("136:시작일 ${txtStartDate.text}-종료일 ${txtEndDate.text} ");
            print("137:인원 - 성인: ${txtManCount.text} 아동: ${txtKidCount.text}");
          }
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.blue),
        ),
        child: const Text("예약하기", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
