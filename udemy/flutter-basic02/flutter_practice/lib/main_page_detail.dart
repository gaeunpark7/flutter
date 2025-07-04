import 'package:flutter/material.dart';

class MainPageDetail extends StatefulWidget {
  const MainPageDetail({super.key});

  @override
  State<MainPageDetail> createState() => _MainPageDetailState();
}

class _MainPageDetailState extends State<MainPageDetail> {
  List<String> lstMenu = ["농담곰", "고로케", "퍼그상"];
  String strSelectMenu = "농담곰";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.blueGrey,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'edit') {
              } else {}
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'edit', child: Text("수정")),
              const PopupMenuDivider(),
              const PopupMenuItem(value: 'delete', child: Text("삭제")),
            ],
            // icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: Column(
        children: [
          DropdownButton(
              value: strSelectMenu,
              items: lstMenu
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {
                strSelectMenu = value ?? lstMenu[0];
                print("105:$value");
                setState(() {});
              })
        ],
      ),
    );
  }
}
