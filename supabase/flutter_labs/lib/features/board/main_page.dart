import 'package:flutter/material.dart';
import 'package:flutter_labs/features/board/add_post_page.dart';
import 'package:flutter_labs/features/board/community_board.dart';
import 'package:flutter_labs/features/myPage/my_page.dart';
import 'package:flutter_labs/group/chat_page.dart';
import 'package:flutter_labs/shared/component/my_bottom.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    _tabController.addListener(tabListener);
  }

  @override
  void dispose() {
    _tabController.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            _tabController.animateTo(index);
          },
          currentIndex: _currentIndex, //현재 선택된 인덱스
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blueGrey,
          backgroundColor: Colors.white,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          items:
              navItems
                  .map(
                    (item) => BottomNavigationBarItem(
                      icon: Icon(item.activeIcon),
                      label: item.label,
                    ),
                  )
                  .toList(),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(), // 스와이핑으로 화면 전환 방지
          controller: _tabController,
          children: [CommunityBoard(), ChatPage(), Container(), MyPage()],
        ),
        floatingActionButton:
            _currentIndex == 0
                ? FloatingActionButton(
                  backgroundColor: Colors.blueGrey,
                  shape: CircleBorder(),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => AddPostPage()),
                    );
                  },
                  child: Icon(Icons.add, color: Colors.white),
                )
                : null,
      ),
    );
  }
}
