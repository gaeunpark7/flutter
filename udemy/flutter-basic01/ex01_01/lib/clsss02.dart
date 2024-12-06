import 'package:flutter/material.dart';

enum LoginStatus { LOGIN, LOGOUT } //열거형

void main() {
  var logCheck = LoginStatus.LOGOUT;

  print(logCheck);

  switch(logCheck){
    case LoginStatus.LOGIN:
    print("현재 사용자명: 홍길동");
    break;
    case LoginStatus.LOGOUT:
    print("로그인 하세요");
    break;
  }
}

abstract class Car {
  //추상클래스
  void run();
  void stop();
}

class SuperCar extends Car {
  //implements
  @override
  void run() {
    print("달린다");
  }

  @override
  void stop() {
    print("멈춘다");
  }
}

//