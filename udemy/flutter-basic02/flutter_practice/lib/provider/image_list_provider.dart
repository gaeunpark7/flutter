import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageListProvider extends StateNotifier<List<String>> {
  ImageListProvider() : super([]);

  void addImage() {
    final int ramdomImage = Random().nextInt(1000);
    String ImageList = "$ramdomImage";
    state = [...state, ImageList];
  }

  void removeImage(int index) {
    if (index > 0 && index < state.length) {
      final newList = List<String>.from(state);
    }
  }
}
