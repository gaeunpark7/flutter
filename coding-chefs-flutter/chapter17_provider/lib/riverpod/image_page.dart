import 'package:chapter17_provider/riverpod/image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'image_list_provider.dart';

class ImagePage extends ConsumerWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageList = ref.watch(imageListNotifier);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Riverpod Image List"),
          backgroundColor: const Color.fromARGB(255, 189, 167, 249),
        ),
        body:
            imageList.isEmpty
                ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("이미지가 없습니다. \n아래 버튼을 눌러 이미지를 추가해보세요!")],
                  ),
                )
                : ListView.builder(
                  itemCount: imageList.length,
                  itemBuilder: (ctx, index) {
                    return ImageCard(
                      imageUrl: imageList[index],
                      index: index,
                      onDelete: () {
                        ref.read(imageListNotifier.notifier).removeImage(index);
                      },
                    );
                  },
                ),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () {
            ref.read(imageListNotifier.notifier).addImage();
          },
          tooltip: '이미지 추가',
          child: const Icon(Icons.add_a_photo),
        ),
      ),
    );
  }
}
