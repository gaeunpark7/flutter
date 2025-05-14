import 'package:flutter/material.dart';
import 'package:flutter_labs/features/auth/home/add_post_page.dart';
import 'package:flutter_labs/features/auth/home/community_board.dart';
import 'package:flutter_labs/features/auth/home/my_page.dart';
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
          selectedFontSize: 10, // 선택된 아이템과 비선택된 아이템의 텍스트 크기 지정
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
        body: Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(), // 스와이핑으로 화면 전환 방지
            controller: _tabController,
            children: [CommunityBoard(), Container(), Container(), MyPage()],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => AddPostPage()),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
