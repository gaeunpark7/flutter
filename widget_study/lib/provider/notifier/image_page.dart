import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_study/provider/notifier/image_notifier.dart';
import 'package:widget_study/provider/notifier/image_tile.dart';

class ImagePage extends ConsumerWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageList = ref.watch(imageListNotifier);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: imageList.isEmpty
            ? Center(child: Text("이미지가 없습니다. 추가해주세요"))
            : ListView.builder(
                itemCount: imageList.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: ImageTile(
                      imageUrl: imageList[index],
                      index: index,
                      onDelete: () {
                        ref.read(imageListNotifier.notifier).removeImage(index);
                      },
                    ),
                  );
                },
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(imageListNotifier.notifier).addImage();
          },
          shape: CircleBorder(),
          backgroundColor: Colors.blueGrey,
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
