import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Preactice extends StatefulWidget {
  const Preactice({super.key});

  @override
  State<Preactice> createState() => _PreacticeState();
}

class _PreacticeState extends State<Preactice>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(tabListner);
  }

  @override
  void dispose() {
    _tabController.removeListener(tabListner);
    super.dispose();
  }

  void tabListner() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }
  Future<List<Map<String, dynamic>>> getPost() async{
    var supabase = Supabase.instance.client;
    final response = await supabase.from("user").select("id, user(id)");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          _tabController.animateTo(index);
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: navItem
            .map((e) => BottomNavigationBarItem(
                icon: Icon(e.iconStyle), label: e.label))
            .toList(),
      ),
      body: TabBarView(
        controller: _tabController,      
        children: const [],
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white, size: 30.0),
      ),
    );
    
  }
}

class NavItem {
  IconData iconStyle;
  String label;

  NavItem({required this.iconStyle, required this.label});
}

final navItem = [
  NavItem(iconStyle: Icons.abc, label: "홈"),
  NavItem(iconStyle: Icons.abc, label: "홈"),
];
