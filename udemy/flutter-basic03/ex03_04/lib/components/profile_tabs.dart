import 'dart:math';

import 'package:flutter/material.dart';

class ProfileTabs extends StatefulWidget {
  const ProfileTabs({super.key});

  @override
  State<ProfileTabs> createState() => _ProfileTabsState();
}

class _ProfileTabsState extends State<ProfileTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<String> lstImages = [];
  late List<String> lstImages2 = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); //초기화, 애니메이션 처리
    var r = Random();

    for (var i = 0; i < 50; i++) {
      lstImages.add("assets/images/곰${i + 1}.jpeg");
      lstImages2.add("https://picsum.photos/id/${r.nextInt(200)}/200/200");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTabBar(),
        _buildTabView(),
      ],
    );
  }

  _buildTabBar() {
    return TabBar(
        labelColor: Colors.black, //선택 색
        unselectedLabelColor: Colors.grey, //선택 x
        indicatorColor: Colors.black, // 밑줄 색상
        controller: _tabController,
        tabs: const [
          Tab(icon: Icon(Icons.apps)),
          Tab(icon: Icon(Icons.video_library_outlined)),
          Tab(icon: Icon(Icons.assignment_ind_outlined)),
        ]);
  }

  _buildTabView() {
    return Expanded(
      child: TabBarView(controller: _tabController, children: [
        Container(child: _buildTab_1()),
        Container(child: _buildTab_2()),
        Container(color: Colors.blue),
      ]),
    );
  }

  _buildTab_1() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: 9,
        itemBuilder: (ctx, index) {
          print("63: $index");
          return InkWell(
            onTap: () {
              print("64: 이미지 클릭${lstImages[index]}");
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child:
                    // Image.network(lstImages[index], fit: BoxFit.cover)
                    Image.asset(lstImages[index], fit: BoxFit.cover)),
          );
        });
  }

  _buildTab_2() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: lstImages2.length,
        itemBuilder: (ctx, index) {
          print("63: $index");
          return InkWell(
            onTap: () {
              print("64: 이미지 클릭${lstImages2[index]}");
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(lstImages2[index], fit: BoxFit.cover)),
          );
        });
  }
}
