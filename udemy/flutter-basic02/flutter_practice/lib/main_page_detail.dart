import 'package:flutter/material.dart';

class MainPageDetail extends StatefulWidget {
  const MainPageDetail({super.key});

  @override
  State<MainPageDetail> createState() => _MainPageDetailState();
}

class _MainPageDetailState extends State<MainPageDetail> {
  String selectedFruit = "사과";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("test"),
        backgroundColor: Colors.blueGrey,
        actions: [
          PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'edit') {
                } else if (value == 'delete') {}
              },
              itemBuilder: (ctx) => [
                    const PopupMenuItem(value: 'edit', child: Text("수정")),
                    const PopupMenuDivider(),
                    const PopupMenuItem(value: 'delete', child: Text("삭제"))
                  ])
        ],
      ),
      body: Center(
        child: Column(children: [
          Text("선택한 과일: $selectedFruit"),
          DropdownButton<String>(
              value: selectedFruit,
              items: ['사과', '포도', '바나나']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedFruit = newValue;
                  });
                }
              }),
          //alertDialog
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: const Text("알람"),
                          content: const Text("안녕하세요"),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("확인")),
                            TextButton(
                                onPressed: () {}, child: const Text("저장"))
                          ],
                        ));
              },
              child: const Text("AlertDialog")),
          ElevatedButton(
              onPressed: () async {
                var ret = await showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (ctx) => Dialog(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text("Dialog"),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("닫기"))
                              ],
                            ),
                          ),
                        ));
              },
              child: const Text("Dialog")),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      fixedSize: const Size(120, 30)),
                  child: const Text("Elevated Button")),
              FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.purple,
                    side: const BorderSide(color: Colors.deepPurple, width: 1),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    foregroundColor: Colors.black,
                  ),
                  child: const Text("Filled Button")),
              OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black,
                    side: BorderSide.none,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                    foregroundColor: Colors.white,
                    elevation: 0,
                  ),
                  child: const Text("Outline Button")),
            ],
          )
        ]),
      ),
    );
  }
}
