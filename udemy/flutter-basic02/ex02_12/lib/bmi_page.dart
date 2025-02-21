import 'package:flutter/material.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  var keyForm = GlobalKey<FormState>();
  var txtheight = TextEditingController();
  var txtweight = TextEditingController();

  @override
  void dispose() {
    txtheight.dispose();
    txtweight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI 측정")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
                key: keyForm,
                child: Column(children: [
                  TextFormField(
                    controller: txtheight,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "키를 입력해주세요";
                      }
                      //에러 문자자
                      try {
                        var ret = int.parse(value);
                      } catch (e) {
                        return "데이터 입력 형식이 잘못되었습니다.(정수를 입력해주세요.)";
                      }

                      return null;
                    },
                    keyboardType: TextInputType.number, //숫자 입력용 자판
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "키",
                        hintText: "키를 cm 단위로 입력해주세요"),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: txtweight,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "몸무게를 입력해주세요";
                      }
                      try {
                        var ret = int.parse(value);
                      } catch (e) {
                        return "데이터 입력 형식이 잘못되었습니다.(정수를 입력해주세요.)";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "몸무게",
                        hintText: "몸무게를 kg 단위로 입력해주세요"),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (keyForm.currentState!.validate()) {
                          print("58: 검증완료");
                        }
                      },
                      child: const Text("결과보기"))
                ]))
          ],
        ),
      ),
    );
  }
}
