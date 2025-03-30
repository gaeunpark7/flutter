import 'package:flutter/material.dart';

class FoodMenu extends StatelessWidget {
  const FoodMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // const SizedBox(height: 20),
        buildMenuItems(Icons.food_bank, "전체"),
        buildMenuItems(Icons.fastfood, "햄버거"),
        buildMenuItems(Icons.local_pizza, "피자"),
        buildMenuItems(Icons.coffee, "커피"),
      ],
    );
  }

  buildMenuItems(IconData icon, String menuName) {
    return Container(
      width: 60,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Icon(icon),
          Text(menuName),
        ],
      ),
    );
  }
}
