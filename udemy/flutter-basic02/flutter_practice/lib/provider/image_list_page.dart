import 'package:flutter/material.dart';
import 'package:flutter_practice/provider/image_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageListPage extends ConsumerWidget {
  const ImageListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageList = ref.watch(imageListNotifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("image List"),
        backgroundColor: Colors.blueGrey,
      ),
      body: imageList.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("이미지가 없습니다. \n 아래 버튼을 눌러 이미지를 추가해주세요"),
                ],
              ),
            )
          : ListView.builder(
              // shrinkWrap: true,
              itemCount: imageList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  // color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          imageList[index],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            // print("progress: $loadingProgress");
                            if (loadingProgress == null) return child;
                            return SizedBox(
                              width: 100,
                              height: 100,
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, exception, stackTrace) {
                            return const SizedBox(
                              height: 100,
                              width: 100,
                              child: Center(
                                child: Icon(Icons.error,
                                    color: Colors.red, size: 50),
                              ),
                            );
                          },
                        ),
                        Text("이미지 ${index + 1}"),
                        IconButton(
                            onPressed: () {
                              ref
                                  .read(imageListNotifier.notifier)
                                  .removeImage(index);
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          ref.read(imageListNotifier.notifier).addImage();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
