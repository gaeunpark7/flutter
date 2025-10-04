import 'package:flutter/material.dart';

class PopupMenuPage extends StatefulWidget {
  const PopupMenuPage({super.key});

  @override
  State<PopupMenuPage> createState() => _PopupMenuPageState();
}

class _PopupMenuPageState extends State<PopupMenuPage> {
  String seletedValue = "사과";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'idit') {
              } else if (value == 'delete') {
                print("삭제 선택");
              }
            },
            itemBuilder: (ctx) => [
              PopupMenuItem(value: 'edit', child: Text("수정")),
              PopupMenuDivider(),
              PopupMenuItem(value: 'delete', child: Text("삭제")),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: seletedValue,
            items: [
              '사과',
              '포도',
              '바나나',
            ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  seletedValue = newValue;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
