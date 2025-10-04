import 'package:flutter/material.dart';
import 'package:youtube/features/home/model/info_model.dart';
import 'package:youtube/features/home/sceens/detail_page.dart';

class AllPage extends StatefulWidget {
  const AllPage({super.key});

  @override
  State<AllPage> createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  final List<InfoModel> info = [
    InfoModel(
      thumbnailImage: "assets/images/hotel6.jpeg",
      profileImage: "assets/images/gomi2.jpeg",
      title: "호텔에서 먹방",
      nickname: "여행 유튜버",
      views: "50만회",
      date: "1년 전",
    ),
    InfoModel(
      thumbnailImage: "assets/images/hotel5.jpeg",
      profileImage: "assets/images/브이곰.png",
      title: "호캉스를 하다.",
      nickname: "농담보틀",
      views: "120만회",
      date: "1시간 전",
    ),
    InfoModel(
      thumbnailImage: "assets/images/hotel2.jpeg",
      profileImage: "assets/images/hotel2.jpeg",
      title: "여행 왔어요",
      nickname: "농담티비",
      views: "1만회",
      date: "10시간 전",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: info.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => DetailPage()),
            );
          },
          child: Column(
            children: [
              Hero(
                tag: 'thumbnailImage',
                child: Image.asset(
                  info[index].thumbnailImage ?? "",
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              buildListTile(info: info, index: index),
            ],
          ),
        );
      },
    );
  }
}

class buildListTile extends StatelessWidget {
  const buildListTile({super.key, required this.info, required this.index});

  final List<InfoModel> info;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ), // 여백을 줄임
      // minLeadingWidth: 10, // leading과 title 사이 간격 최소화
      leading: CircleAvatar(
        radius: 25, // 프로필 이미지 크기 줄임
        backgroundImage: AssetImage(info[index].profileImage),
      ),
      title: Text(
        info[index].title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Row(
        children: [
          Text(info[index].nickname, style: TextStyle(color: Colors.grey)),
          SizedBox(width: 8),
          Text(info[index].views, style: TextStyle(color: Colors.grey)),
          SizedBox(width: 8),
          Text(info[index].date, style: TextStyle(color: Colors.grey)),
        ],
      ),
      trailing: Icon(Icons.more_vert, color: Colors.white),
    );
  }
}
