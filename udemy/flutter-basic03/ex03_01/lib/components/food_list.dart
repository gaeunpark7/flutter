import 'package:ex03_01/components/food_menu.dart';
import 'package:ex03_01/tools/utils.dart';
import 'package:flutter/material.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          const FoodMenu(),
          const SizedBox(height: 20),
          foodItems("가을옷", "s01", Utils().getGenerateString(100)),
          foodItems("겨울옷", "s06", Utils().getGenerateString(100)),
          foodItems("겨울옷", "s07", Utils().getGenerateString(100)),
        ],
      ),
    );
  }

  foodItems(String title, String img, String content) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                fontFamily: "Nanum", fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        AspectRatio(
          //이미지 비율 잡아줌.
          aspectRatio: 2 / 1, //가로비/세로비
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("assets/images/$img.jpeg",
                // width: 400, height: 200,
                fit: BoxFit.fill),
          ),
        ),
        const SizedBox(height: 10),
        Text(content),
        const SizedBox(height: 20),
      ],
    );
  }
}
