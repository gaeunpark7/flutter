import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageListProvider extends StateNotifier<List<String>> {
  ImageListProvider() : super([]);

  void addImage() {
    final randomImage = Random().nextInt(1000);
    String imageUrl = "https://picsum.photos/seed/$randomImage/200/300";
    print(imageUrl);
    state = [...state, imageUrl];
  }

  void removeImage(int index) {
    if (index >= 0 && index < state.length) {
      final newList = List<String>.from(state);
      newList.removeAt(index);
      state = newList;
    }
  }
}

final imageListNotifier =
    StateNotifierProvider<ImageListProvider, List<String>>(
        (ref) => ImageListProvider());
