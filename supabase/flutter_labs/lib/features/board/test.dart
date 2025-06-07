import 'package:flutter/material.dart';
import 'package:flutter_labs/features/board/add_post_page.dart';
import 'package:flutter_labs/shared/component/my_bottom.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget>
    with SingleTickerProviderStateMixin {
  var _currentIndex;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(tabListender);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.removeListener(tabListender);
  }

  void tabListender() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          _tabController.animateTo(index);
        },

        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedFontSize: 10,
        selectedFontSize: 10,
        items:
            NatItems.map(
              (item) => BottomNavigationBarItem(
                icon: Icon(item.iconData),
                label: item.labelText,
              ),
            ).toList(),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
        
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => AddPostPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class NavItem {
  final IconData iconData;
  final String labelText;

  NavItem({required this.iconData, required this.labelText});
}

var NatItems = [
  NavItem(iconData: Icons.abc, labelText: "테스트"),
  NavItem(iconData: Icons.abc, labelText: "테스트"),
];
