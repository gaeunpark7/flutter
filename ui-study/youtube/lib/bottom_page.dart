import 'package:flutter/material.dart';
import 'package:youtube/features/home/sceens/home_page.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage>
    with SingleTickerProviderStateMixin {
  int _selectIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _tabListener(int index) {
    setState(() {
      _selectIndex = index;
      _tabController.index = index; //탭바뷰와  동기화
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(), //스와이프 방지
        children: [
          HomePage(),
          Center(child: Text("홈 페이지")),
          Center(child: Text("홈 페이지")),
          Center(child: Text("홈 페이지")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 53, 52, 52),
        shape: CircleBorder(),
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white, size: 40),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        shape: CircularNotchedRectangle(), //FAB 자리 파여짐
        notchMargin: 5, //FAB 파인 여백
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, "홈", 0),
            _buildNavItem(Icons.video_library, "Shorts", 1),
            const SizedBox(width: 40), // FAB 자리 확보
            _buildNavItem(Icons.subscriptions, "구독", 2),
            _buildNavItem(Icons.person, "내 페이지", 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectIndex == index;
    // final color = isSelected ? Colors.red : Colors.grey;
    // IconData icon;

    switch (index) {
      case 0:
        icon = isSelected ? Icons.home : Icons.home_outlined;
        break;
      case 1:
        icon = isSelected ? Icons.video_library : Icons.video_library_outlined;
        break;
      case 2:
        icon = isSelected ? Icons.subscriptions : Icons.subscriptions_outlined;
        break;
      case 3:
        icon = isSelected ? Icons.person : Icons.person_outline;
        break;
      default:
        icon = Icons.home_outlined;
    }
    return InkWell(
      onTap: () => _tabListener(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
