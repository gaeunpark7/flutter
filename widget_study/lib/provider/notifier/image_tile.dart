import 'package:flutter/material.dart';

class ImageTile extends StatelessWidget {
  final String imageUrl;
  final int index;
  final VoidCallback onDelete;
  const ImageTile({
    super.key,
    required this.imageUrl,
    required this.index,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey[200],
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      leading: Image.network(
        imageUrl,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        //에러일때
        errorBuilder: (context, exception, stackTrace) {
          return SizedBox(
            width: 100,
            height: 100,
            child: Center(child: Icon(Icons.error, color: Colors.red)),
          );
        },
      ),
      title: Text("item$index"),
      trailing: GestureDetector(onTap: () {}, child: Icon(Icons.delete)),
    );
  }
}
