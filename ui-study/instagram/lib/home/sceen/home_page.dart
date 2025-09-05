import 'package:flutter/material.dart';
import 'package:instagram/home/model/profile_model.dart';
import 'package:instagram/home/widget/feed_widget.dart';
import 'package:instagram/home/widget/story_section_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController(initialPage: 0);
  final int _currentPage = 0;
  List<Profile> profile = [
    Profile(nickname: "내 스토리", profileImage: ""),
    Profile(nickname: '_v_gom', profileImage: "assets/profile_image/브이곰.png"),
    Profile(nickname: 'o2o3o1', profileImage: "assets/profile_image/쿵푸곰.jpeg"),
    Profile(nickname: 'owo', profileImage: "assets/profile_image/하늘곰.jpeg"),
  ];

  List<Post> post = [
    Post(
      profileImage: "assets/profile_image/브이곰.png",
      nickname: "_v_gom",
      location: "서울",
      postImages: [
        "assets/profile_image/gomi2.jpeg",
        "assets/profile_image/쿵푸곰.jpeg",
        "assets/profile_image/하늘곰.jpeg",
      ],
      descript: "우리 딸랑구 유치원 입학",
    ),
    Post(
      profileImage: "assets/profile_image/하늘곰.jpeg",
      nickname: "하늘곰",
      location: "하늘",
      postImages: [
        "assets/profile_image/하늘곰.jpeg",
        "assets/profile_image/하늘곰.jpeg",
        "assets/profile_image/하늘곰.jpeg",
      ],
      descript: "우리 딸랑구 유치원 입학",
    ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            StorySectionWidget(profiles: profile),
            const Divider(),
            //피드 영역
            ListView.builder(
              itemCount: post.length,
              itemBuilder: (context, index) {
                return FeedWidget(post: post[index]);
              },
              //ListView 안에 ListView 넣을 때 필수 옵션
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}
