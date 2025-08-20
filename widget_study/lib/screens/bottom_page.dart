//tabBarView, BottomNavigation
import 'package:flutter/material.dart';
import 'package:widget_study/screens/main_page.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(tabListener);
  }

  @override
  void dispose() {
    _tabController.removeListener(tabListener);
    _tabController.dispose();
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
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blueGrey,
          unselectedFontSize: 10,
          selectedFontSize: 10,
          items: navItems
              .map(
                (item) => BottomNavigationBarItem(
                  icon: Icon(item.icon),
                  label: item.label,
                ),
              )
              .toList(),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            MainPage(),
            Container(color: Colors.amber),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}

class NavItem {
  final IconData icon;
  final String label;

  NavItem({required this.icon, required this.label});
}

List navItems = [
  NavItem(icon: Icons.home, label: "홈"),
  NavItem(icon: Icons.group, label: "그룹"),
  NavItem(icon: Icons.chat_bubble, label: "채팅"),
  NavItem(icon: Icons.my_library_add, label: "마이페이지"),
];
