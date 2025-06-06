import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'image_list_notifier.g.dart';

@riverpod
class ImageListNotifier extends _$ImageListNotifier{
@override
List<String>build(){
  return [];
}
  void addImage(){
    final randomImage= Random().nextInt(1000);
    final imageUrl = 'https://picsum.photos/seed/$randomImage/200/300';
    state = [...state, imageUrl];
  }

  void removeImage(int index){
    if(index>=0 && index<state.length){
      final newList = List<String>.from(state);
      state = newList;
    }
  }

}