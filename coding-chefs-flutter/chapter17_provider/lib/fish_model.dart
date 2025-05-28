import 'package:flutter/widgets.dart';

class Salmon with ChangeNotifier {
  final String fishName;
  int fishNumber;
  final String fishSize;

  Salmon({
    required this.fishName,
    required this.fishNumber,
    required this.fishSize,
  });

  void changeFishNumber() {
    fishNumber++;
    notifyListeners();
  }
}
