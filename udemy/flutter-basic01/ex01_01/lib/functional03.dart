import 'dart:math';

void main() {
  var lst = [1, 9, 3, 4, 5];

//max값 구하기
  var lstMax = lst.reduce((value, element) => max(value, element));
  print(lstMax);

//계단형 표기법
  var li = [10, 20, 30, 40];

  li //30 지우고, 99생성
    ..add(99)
    ..remove(30);

  //ceo일때 4추가
  var isCeo = true;
  var li2 = [1, 2, 3, if (isCeo) 4];
  print(li2);

//collection for문
  var li3 = [10, 20, 30];
  var li4 = [100, 200, for (var e in li3) e * 2]; // [100, 200, 20, 40, 60] 출력

  print(li4);
}
