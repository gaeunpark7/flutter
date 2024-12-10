import 'package:flutter/material.dart';

class ProdView extends StatefulWidget {
  const ProdView({super.key});


  @override
  State<ProdView> createState() => _ProdViewState();
}

class _ProdViewState extends State<ProdView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("발리 여행 패키지")),
        body: Column(
          children: [
            Hero(
              tag: "prod01",
              child: Image.asset(
                "assets/bali.jpg", height: 200,
                width: double.infinity, //옆으로 꽉찬 이미지
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "발리 여행 패키지",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("뒤로가기")),
          ],
        ));
  }
}
