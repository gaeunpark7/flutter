import 'package:flutter/material.dart';

class MySize {
  //여백
  static double size_xl = 50;
  static double size_l = 30;
  static double size_m = 20;
  static double size_s = 10;
  static double size_xs = 5;

  //화면크기
  static Size getScreenSize(BuildContext ctx) {
    return MediaQuery.of(ctx).size;
  }

  //메인 이미지 높이
  static double header_height = 500;
}
