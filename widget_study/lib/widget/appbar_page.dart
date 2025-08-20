import 'package:flutter/material.dart';

class AppbarPage extends StatefulWidget {
  const AppbarPage({super.key});

  @override
  State<AppbarPage> createState() => _AppbarPageState();
}

class _AppbarPageState extends State<AppbarPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        color: Colors.grey[200],
        width: MediaQuery.of(context).size.width * 0.66,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey),

              child: Column(
                children: [
                  Text("Drawer Header"),
                  ClipOval(
                    child: Image.network(
                      "https://picsum.photos/seed/picsum/200/300",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("홈"),
              trailing: Icon(Icons.delete),
              onTap: () {},
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Builder(
              builder: (ctx) => IconButton(
                onPressed: () {
                  Scaffold.of(ctx).openDrawer();
                },
                icon: Icon(Icons.menu),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  labelText: "검색하기",
                  prefixIcon: Icon(Icons.search_outlined),
                ),
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.notifications_active_outlined),
            SizedBox(width: 10),
            Icon(Icons.favorite_outline),
            SizedBox(width: 10),
            Icon(Icons.shopping_cart_outlined),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          indicatorColor: Colors.black,
          tabs: [
            Tab(text: "채널"),
            Tab(text: "집들이"),
            Tab(text: "집사진"),
            Tab(text: "살림수납"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(),
          Container(color: Colors.amber),
          Container(color: Colors.blue),
          Container(),
        ],
      ),
    );
  }
}
