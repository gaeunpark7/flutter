import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<Map<String, String>> profile = [
    {'nickname': "내 스토리", 'image': ""},
    {'nickname': '_v_gom', 'image': "assets/profile_image/브이곰.png"},
    {'nickname': 'o2o3o1', 'image': "assets/profile_image/쿵푸곰.jpeg"},
    {'nickname': 'owo', 'image': "assets/profile_image/하늘곰.jpeg"},
  ];
  final List<Map<String, String>> posts = [
    {
      'image': 'assets/profile_image/브이곰.png',
      'nickname': '_v_gom',
      "location": '서울',
      'post': 'assets/profile_image/gomi2.jpeg',
      'post2': 'assets/profile_image/쿵푸곰.jpeg',
      'post3': 'assets/profile_image/하늘곰.jpeg',
      'descript': '우리 딸랑구 유치원 입학',
    },
    {
      'image': 'assets/profile_image/하늘곰.jpeg',
      'nickname': 'gaeungaeun',
      "location": '하늘',
      'post': 'assets/profile_image/쿵푸곰.jpeg',
      'post2': 'assets/profile_image/쿵푸곰.jpeg',
      'post3': 'assets/profile_image/하늘곰.jpeg',
      'descript': '우리 딸랑구 유치원 입학',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              "Damstagram",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.keyboard_arrow_down_outlined),
            Spacer(),
            Icon(Icons.add_box_outlined),
            const SizedBox(width: 5),
            Icon(Icons.favorite_outline),
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: profile.length,
              itemBuilder: (context, index) {
                final nickname = profile[index]['nickname'];
                final image = profile[index]['image'];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(image ?? ''),
                        backgroundColor: nickname == "내 스토리"
                            ? Colors.grey[200]
                            : Colors.amber,
                        child: nickname == "내 스토리"
                            ? Icon(
                                Icons.person,
                                size: 70,
                                color: Colors.grey[600],
                              )
                            : null,
                      ),
                      const SizedBox(height: 5),
                      Text(nickname ?? ''),
                    ],
                  ),
                );
              },
            ),
          ),
          //피드 영역
          ...posts.map((post) {
            final images = [post['post'], post['post2'], post['post3']];

            return Card(
              color: Colors.white,
              elevation: 0,
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(post['image'] ?? ''),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(post['nickname'] ?? ''),
                          Text(post['location'] ?? ''),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.more_horiz),
                    ],
                  ),
                  SizedBox(
                    height: 270,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        PageView.builder(
                          itemCount: 3,
                          onPageChanged: (value) {
                            setState(() {
                              _currentPage = value;
                            });
                          },
                          itemBuilder: (context, index) {
                            final image = images[index];
                            return image!.isNotEmpty
                                ? Image.asset(image, fit: BoxFit.cover)
                                : Container();
                          },
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),

                            child: Row(
                              children: List.generate(
                                3,
                                (index) => Container(
                                  margin: EdgeInsets.symmetric(horizontal: 2),
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _currentPage == index
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //아이콘
                  Row(
                    children: [
                      Icon(Icons.favorite, size: 35),
                      const SizedBox(width: 10),
                      Icon(Icons.chat_bubble_outline, size: 35),
                      const SizedBox(width: 10),

                      // Icon(Icons.send_outlined, size: 35),
                      Spacer(),
                      Icon(Icons.bookmark, size: 40),
                    ],
                  ),
                  //설명
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text("님 여러명이 좋아합니다."),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              post['nickname'] ?? '',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 5),
                            Text(post['descript'] ?? ''),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
