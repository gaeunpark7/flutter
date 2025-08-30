import 'dart:math';

import 'package:flutter/material.dart';

class GridviewPage extends StatefulWidget {
  const GridviewPage({super.key});

  @override
  State<GridviewPage> createState() => _GridviewPageState();
}

class _GridviewPageState extends State<GridviewPage> {
  List<String> lstImage = [];

  @override
  void initState() {
    super.initState();

    var r = Random();
    for (var i = 0; i < 50; i++) {
      lstImage.add("https://picsum.photos/id/${r.nextInt(200)}/200/200");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: lstImage.length,
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(lstImage[index], fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
