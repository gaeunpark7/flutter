void main() {
  //map: 키,값
  Map<String, String> p1 = {
    "kdi1010": "프린터",
    "kdil1011": "모니터",
    "kdi3091": "빔프로젝트"
  };

  print(p1["kdi3091"]);
  p1["kdi3092"] = "칠판"; //p1 데이터 추가
  print(p1);

  Map<String, dynamic> p2 = {
    //var p2로 사용해도 무관
    "이름": "홍길동",
    "나이": 10,
  };

  var subCity = ["인천", "세종시"];
  var city = ["서울", "경기", ...subCity]; //리스트 합침, 중간에 넣어도 무관
  print(city);
}
