void main() {
  var p1 = [10, 20, 30, 40, 40, 50];

  var p2 = p1.where((e) => e > 30).toSet().toList(); //중복제거, list로 바꿔줌.() => []
  print(p2);

  //for문 안써도, 인덱스 차례대로 출력
  for (var e in p1) {
    print("점수: $e");
  }

  p1
      .where((e) => e >= 30) //30 이상일때 출력
      .forEach((e) {
    print("합격자번호: $e");
  });

  p1.any((e) => e >= 30); //만족되는 값이 있으면 true, false
}
