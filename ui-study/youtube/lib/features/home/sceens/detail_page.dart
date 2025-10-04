import 'package:flutter/material.dart';
import 'package:youtube/features/home/model/info_model.dart';
import 'package:youtube/features/home/sceens/all_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final List<Map<String, dynamic>> subButton = [
    {'icon': Icons.thumb_up, 'text': '좋아요'},
    {'icon': Icons.comment, 'text': '댓글'},
    {'icon': Icons.share, 'text': '공유'},
    {'icon': Icons.save, 'text': '저장'},
    {'icon': Icons.save, 'text': '클립'},
  ];
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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //썸네일 이미지 - 고정
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              color: Colors.grey,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.7,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //제목
                        Text(
                          "제목",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        //조회수, 날짜, 쇼핑
                        Row(
                          children: [
                            Text("조회수", style: TextStyle(color: Colors.grey)),
                            SizedBox(width: 5),
                            Text("47만회", style: TextStyle(color: Colors.grey)),
                            SizedBox(width: 5),
                            Text("날짜", style: TextStyle(color: Colors.grey)),
                            SizedBox(width: 5),
                            Icon(
                              Icons.shop_outlined,
                              size: 20,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 5),
                            Text("쇼핑", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        //유튜버 이름, 구독버튼
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 5,
                          ), //
                          leading: CircleAvatar(
                            backgroundColor: Colors.blueGrey,
                          ),
                          title: Row(
                            children: [
                              Text(
                                "유튜버",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "조회수",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          trailing: FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 5,
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "구독",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        //스크롤 버튼
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              subButton.length,
                              (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FilledButton(
                                  style: FilledButton.styleFrom(
                                    backgroundColor: Colors.grey[900],
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 5,
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Icon(subButton[index]['icon']),
                                      SizedBox(width: 5),
                                      Text("${subButton[index]['text']}"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //댓글
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        SizedBox(height: 15),
                        //추천 동영상 리스트
                        Column(
                          children: List.generate(info.length, (index) {
                            return Column(
                              children: [
                                Image.asset(
                                  info[index].thumbnailImage ?? "",
                                  height: 250,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                buildListTile(info: info, index: index),
                              ],
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
