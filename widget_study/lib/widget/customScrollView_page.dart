import 'package:flutter/material.dart';

class CustomscrollviewPage extends StatefulWidget {
  const CustomscrollviewPage({super.key});

  @override
  State<CustomscrollviewPage> createState() => _CustomscrollviewPageState();
}

class _CustomscrollviewPageState extends State<CustomscrollviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            title: const Text("게시판", style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.blueGrey,
            centerTitle: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                leading: Icon(Icons.person),
                title: Text("제목 $index"),
                trailing: Icon(Icons.delete),
              ),
              childCount: 20,
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                color: Colors.blue,
                child: Center(child: Text("그리드 $index")),
              ),
              childCount: 10,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}
