import 'package:flutter/material.dart';

class CommunityBoard extends StatefulWidget {
  const CommunityBoard({super.key});

  @override
  State<CommunityBoard> createState() => _CommunityBoardState();
}

class _CommunityBoardState extends State<CommunityBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("게시판", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("닉네임"),
                              const Text("|"),
                              Text("1일전"),
                            ],
                          ),
                          Text("제목 $index"),
                        ],
                      ),
                    ],
                  ),
                  Text("본문"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
