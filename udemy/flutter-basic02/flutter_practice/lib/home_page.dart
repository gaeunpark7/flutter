import 'package:flutter/material.dart';
import 'package:flutter_practice/main_page.dart';
import 'package:flutter_practice/my_bottom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(tabListener);
    super.initState();
  }

  @override
  dispose() {
    _tabController.dispose();
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
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            items: navItem
                .map((e) => BottomNavigationBarItem(
                    icon: Icon(e.activeIcon), label: e.label))
                .toList()),
        body: TabBarView(controller: _tabController, children: [
          const MainPage(),
          Container(color: Colors.orange),
          Container(color: Colors.red),
          Container(),
        ]),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blueGrey,
            shape: const CircleBorder(),
            onPressed: () {},
            child: const Icon(Icons.add, color: Colors.white)),
      ),
    );
  }
}
