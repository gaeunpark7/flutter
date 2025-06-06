import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageListNotifier extends StateNotifier<List<String>> {
  ImageListNotifier() : super([]);

  void addImage() {
    final randomImage = Random().nextInt(1000);
    final ImageUrl = 'https://picsum.photos/seed/$randomImage/200/300';
    state = [...state, ImageUrl];
  }

  void removeImage(int index) {
    if (index >= 0 && index < state.length) {
      final newList = List<String>.from(state); //기존리스트 복사
      newList.removeAt(index);
      state = newList; //새 리스트 상태로 업데이트
    }
  }
}

final imageListNotifier =
    StateNotifierProvider<ImageListNotifier, List<String>>(
      (ref) => ImageListNotifier(),
    );
