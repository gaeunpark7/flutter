import 'package:flutter/material.dart';
import 'package:instagram/home/sceen/home_page.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
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
          backgroundColor: Colors.white,
          onTap: (int index) {
            _tabController.animateTo(index);
          },
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false, // 선택된 라벨 숨김
          showUnselectedLabels: false, // 선택 안 된 라벨 숨김
          items: navItem
              .map(
                (item) => BottomNavigationBarItem(
                  icon: Icon(item.icon, size: 32),
                  label: item.label,
                ),
              )
              .toList(),

          selectedItemColor: Colors.black,
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            HomePage(),
            Container(color: Colors.red),
            Container(color: Colors.orange),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}

class NavItem {
  IconData icon;
  String label;

  NavItem({required this.icon, required this.label});
}

List navItem = [
  NavItem(icon: Icons.home, label: ""),
  NavItem(icon: Icons.search, label: ""),
  NavItem(icon: Icons.video_library_outlined, label: ""),
  NavItem(icon: Icons.send_outlined, label: ""),
  NavItem(icon: Icons.account_circle_outlined, label: ""),
];
