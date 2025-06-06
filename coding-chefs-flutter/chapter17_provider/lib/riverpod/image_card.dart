import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imageUrl;
  final int index;
  final VoidCallback onDelete;

  const ImageCard({
    super.key,
    required this.imageUrl,
    required this.index,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child; //로딩이 끝났으면 이미지 보여줌
                return SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(
                    child: CircularProgressIndicator(
                      value:
                          loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                    ),
                  ),
                );
              },
              errorBuilder: (context, exception, stackTrace) {
                return SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(
                    child: Icon(Icons.error, color: Colors.red, size: 50),
                  ),
                );
              },
            ),
            const SizedBox(width: 10),
            Expanded(child: Text("이미지 ${index + 1}")),
            IconButton(
              onPressed: onDelete,
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
