import 'package:flutter/material.dart';
import 'package:youtube/features/home/sceens/all_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final List<String> tabTitles = ["전체", "새로운 맞춤", "뉴스", "게임", "믹스", "라이브"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, title: _buildAppBar()),

      body: Column(
        children: [
          _buildTabTitle(),
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: [
                AllPage(),
                Center(
                  child: Text(
                    '새로운 맞춤 동영상 페이지',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Center(child: Text('뉴스 페이지')),
                Center(child: Text('게임 페이지')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView _buildTabTitle() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(tabTitles.length, (index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white
                    : const Color.fromARGB(255, 45, 45, 45),
                borderRadius: BorderRadius.circular(10),
                // border: isSelected
                //     ? Border.all(color: Colors.grey.shade300)
                // : null,
              ),
              child: Text(
                tabTitles[index],
                style: TextStyle(
                  fontSize: 15,
                  color: isSelected ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _buildAppBar extends StatelessWidget {
  const _buildAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset("assets/images/youtube.png", width: 50, height: 50),
        SizedBox(width: 5),
        Text(
          "Youtube",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Icon(Icons.cast, color: Colors.white, size: 30),
        SizedBox(width: 15),
        Icon(Icons.notifications_outlined, color: Colors.white, size: 30),
        SizedBox(width: 15),
        Icon(Icons.search, color: Colors.white, size: 30),
      ],
    );
  }
}
