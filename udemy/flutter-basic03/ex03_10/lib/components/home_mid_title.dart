import 'package:ex03_10/common/my_size.dart';
import 'package:ex03_10/common/my_style.dart';
import 'package:flutter/material.dart';

class HomeMidTitle extends StatefulWidget {
  const HomeMidTitle({super.key});

  @override
  State<HomeMidTitle> createState() => _HomeMidTitleState();
}

class _HomeMidTitleState extends State<HomeMidTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("'플러터'", style: MyStyle.h6(color: Colors.blue)),
            SizedBox(width: MySize.size_m),
            Text("Best 상품", style: MyStyle.h6()),
          ],
        ),
        SizedBox(height: MySize.size_s),
        const Divider(),
        SizedBox(height: MySize.size_s),
        // Container(color: const Color(0xffc0c0c0), width: 400)
        const Text(
          "지난 15년간 가장 많이 이용하신 '플러터여행 인기상품 BEST 6",
          style: TextStyle(fontSize: 15),
        )
      ],
    );
  }
}
