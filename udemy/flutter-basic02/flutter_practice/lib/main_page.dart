import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> posts = List.generate(20, (index) => "제목 ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          pinned: false,
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text("게시판", style: TextStyle(color: Colors.white)),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(childCount: posts.length,
                (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text("${index + 1}")),
              title: Text(posts[index]),
              subtitle: const Text("여기에 본문이 들어가요.",
                  maxLines: 2, overflow: TextOverflow.ellipsis),
            ),
          );
        }))
      ],
    );
  }
}
