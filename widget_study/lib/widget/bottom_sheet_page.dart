import 'package:flutter/material.dart';

class BottomSheetPage extends StatefulWidget {
  const BottomSheetPage({super.key});

  @override
  State<BottomSheetPage> createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("BottomSheet 예제")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (ctx) => Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "옵션 선택",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.share),
                          title: Text("공유하기"),
                          onTap: () => Navigator.pop(context, "공유"),
                        ),
                        ListTile(
                          leading: const Text("링크 복사"),
                          onTap: () => Navigator.pop(context, "링크"),
                        ),
                        ListTile(
                          leading: const Icon(Icons.delete, color: Colors.red),
                          title: const Text("삭제"),
                          onTap: () => Navigator.pop(context, "삭제"),
                        ),
                      ],
                    ),
                  ),
                ).then((value) {
                  if (value != null) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('$value 선택됨')));
                  }
                });
              },
              child: Text("BottomSheet"),
            ),
            Center(
              child: Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      Scaffold.of(context).showBottomSheet(
                        (context) => Container(
                          height: 200,
                          color: Colors.blue[100],
                          child: const Center(child: Text("고정 BottomSheet")),
                        ),
                      );
                    },
                    child: const Text("Persistent BottomSheet 열기"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
