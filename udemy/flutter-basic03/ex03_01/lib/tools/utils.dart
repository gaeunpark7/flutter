import 'dart:math';

class Utils {
  getGenerateString(int len) {
    var r = Random();
    var chars = "가나다라마바사아자차카";

    return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
  }
}
