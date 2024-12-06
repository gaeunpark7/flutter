import 'package:flutter/material.dart';

void main() {
  var p1 = Person('홍길동', 10, '1234');
  var p2 = Person('홍길현', 20);

  print("성명: ${p1.name} 나이: ${p1.age} 비밀번호: ${p1._password}");
  print("성명: ${p2.name} 나이: ${p2.age}");
}

class Person {
  String name;
  int age;
  final String? _password; //_해당 파일에만 접근 가능, null허용

  Person(@required this.name, this.age,
      [this._password]); //생성자 정의, this._password는 선택적 매개변수
  //@required 필수로 사용해야함.
}
