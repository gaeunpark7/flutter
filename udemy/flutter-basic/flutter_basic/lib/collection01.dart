void main() {
  List<String> city = ["서울", "경기", "인천"];
  var score = [10, 20, 30, 40, 50, 60, 70, 88];

  score.removeWhere((e) => e < 80); //80 미만이면 지움
  for (int i = score.length - 1; i >= 0; i--) {
    if (score[i] < 80) {
      score.removeAt(i);
    }
  }

  city.add("강원도"); //리스트 추가
  city.remove("경기"); //리스트 지움
  print(city);
  while (city.contains("강원도")) {
    //특정값 찾음 true, false
    city.remove("강원도"); //강원도가 있을 때 지움
  }
  city.removeAt(1); //인덱스 지움
}
