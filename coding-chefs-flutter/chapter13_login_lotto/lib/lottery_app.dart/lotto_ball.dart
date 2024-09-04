import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LottoBall extends StatelessWidget {
  const LottoBall({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //SVG 이미지가 들어갈 공간
      width: 50,
      height: 50,
      child: SvgPicture.asset(
        path, //이미지 경로
        colorFilter: const ColorFilter.mode(
          //SVG 이미지 색상 필터링 및 변경
          Colors.black,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
