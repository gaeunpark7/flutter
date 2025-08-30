import 'package:flutter/material.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      foregroundColor: Colors.white,
                      fixedSize: Size(150, 20),
                    ),
                    onPressed: () {
                      _buildDialog(context);
                    },
                    child: Text("dialog"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      foregroundColor: Colors.white,
                      fixedSize: Size(150, 20),
                    ),
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (ctx) => AlertDialog(
                          backgroundColor: Colors.grey[200],
                          title: Text("경고"),
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("정말 삭제하시겠습니까?"),
                                Text("삭제시 다시 복구 할 수 없습니다."),
                              ],
                            ),
                          ),

                          actions: [
                            TextButton(onPressed: () {}, child: Text("확인")),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("취소"),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text("AlertDialog"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _buildDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "dialog",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("커스텀이 필요한 dialog 입니다."),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("닫기"),
            ),
          ],
        ),
      ),
    );
  }
}
