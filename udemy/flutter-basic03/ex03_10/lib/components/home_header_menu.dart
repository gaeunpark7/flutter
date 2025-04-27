import 'package:ex03_10/common/my_color.dart';
import 'package:ex03_10/common/my_size.dart';
import 'package:ex03_10/common/my_style.dart';
import 'package:flutter/material.dart';

class HomeHeaderMenu extends StatefulWidget {
  const HomeHeaderMenu({super.key});

  @override
  State<HomeHeaderMenu> createState() => _HomeHeaderMenuState();
}

class _HomeHeaderMenuState extends State<HomeHeaderMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              "assets/images/pngwing.com.png",
              // width: 50,
              height: 30,
              fit: BoxFit.cover,
              color: const Color.fromARGB(
                255,
                142,
                182,
                255,
              ),
            ),
            Text(
              "에어비앤비",
              style: MyStyle.h5(color: const Color.fromARGB(255, 59, 48, 48)),
            ),
            const Spacer(),
            Text("추천여행", style: MyStyle.subtitle()),
            SizedBox(width: MySize.size_s),
            // Text("로그인", style: MyStyle.subtitle()),
            SizedBox(width: MySize.size_s),
            //회원가입
            InkWell(
                onTap: () {
                  print("회원가입 클릭");
                },
                child: Text("회원가입", style: MyStyle.subtitle())),
            SizedBox(width: MySize.size_s),
            //로그인
            InkWell(
                onTap: () {
                  print("로그인 클릭");
                },
                child: Text("로그인",
                    style: MyStyle.subtitle(
                        color: const Color.fromARGB(255, 78, 157, 221)))),
          ],
        ),
      ),
    );
  }
}
