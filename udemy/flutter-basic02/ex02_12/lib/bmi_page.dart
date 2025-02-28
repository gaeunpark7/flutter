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

  var strResult;
  var db_bmi = 0.0;

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
                      //에러 문자
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
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (keyForm.currentState!.validate()) {
                            print("58: 검증완료");
                            print("91 = 키 ${txtheight.text}");
                            print("92 = 몸무게 ${txtweight.text}");

                            int intweight =
                                int.parse(txtweight.text.trim()); //trim() 공백제거
                            int intheigh = int.parse(txtheight.text.trim());

                            db_bmi = (intweight /
                                ((intheigh / 100) * (intheigh / 100)));

                            setState(() {});
                          }
                        },
                        child: const Text("결과보기")),
                  )
                ])),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("결과: "),
                Text(
                    "${getBmiString(db_bmi)}  ${db_bmi.toString().substring(0, 5)}",
                    style: TextStyle(fontSize: 15, color: bmiColor(db_bmi)))
              ],
            )
          ],
        ),
      ),
    );
  }

  String getBmiString(double dbBmi) {
    if (dbBmi == 0.0) return "";

    if (dbBmi >= 25) {
      return "비만";
    } else if (dbBmi >= 23) {
      return "과체중";
    } else if (dbBmi >= 18.5) {
      return "정상";
    } else
      return "저체중";
  }

  bmiColor(double dbBmi) {
    if (dbBmi == 0.0) return Colors.black;

    if (dbBmi >= 25) {
      return Colors.red;
    } else if (dbBmi >= 23) {
      return Colors.deepOrange;
    } else if (dbBmi >= 18.5) {
      return Colors.black;
    } else
      return const Color.fromARGB(255, 130, 126, 95);
  }
}
