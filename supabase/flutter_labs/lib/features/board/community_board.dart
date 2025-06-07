import 'package:flutter/material.dart';
import 'package:flutter_labs/features/board/community_borad_detail.dart';
import 'package:flutter_labs/shared/constants/my_text_style.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart'; //날짜 포맷을 위한 패키지

class CommunityBoard extends StatefulWidget {
  const CommunityBoard({super.key});

  @override
  State<CommunityBoard> createState() => _CommunityBoardState();
}

class _CommunityBoardState extends State<CommunityBoard> {
  Future<List<Map<String, dynamic>>> getPosts() async {
    final supabase = Supabase.instance.client;
    final response = await supabase
        .from('posts')
        .select(
          'id, title, content, create_at, user_id, users(nickname, profile_image)',
        )
        .order('create_at', ascending: false); // 최신순 정렬

    print(response);
    return List<Map<String, dynamic>>.from(response);
  }

  String formatDate(String timestampe) {
    final date = DateTime.parse(timestampe);
    return DateFormat('MM.dd').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: getPosts(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("데이터를 불러오는 중 오류가 발생했습니다."));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("게시물이 없습니다."));
            }
            final posts = snapshot.data!;

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true, // 스크롤 시 앱바가 바로 나타남
                  pinned: false, // 스크롤 시 앱바가 상단에 고정되지 않음
                  // expandedHeight: 10, // 앱바 높이
                  title: const Text(
                    "게시판",
                    style: TextStyle(color: Colors.white),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.blueGrey,
                ),

                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final post = posts[index];
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            print("카드 클릭됨");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (ctx) => CommunityBoradDetail(post: post),
                              ),
                            );
                          },
                          child: Card(
                            color: Colors.white,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),

                              child: cardDesign(
                                nickname: post['users']?['nickname'] ?? '알수없음',
                                date: formatDate(post['create_at']),
                                title: post['title'] ?? '제목없음',
                                content: post['content'] ?? '내용없음',
                                profileImageUrl:
                                    post['users']?['profile_image'],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: posts.length, // 게시물 개수
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget cardDesign({
    required String nickname,
    required String date,
    required String title,
    required String content,
    String? profileImageUrl,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            profileImageUrl == null || profileImageUrl.isEmpty
                ? const CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: Icon(Icons.person, color: Colors.white),
                )
                : CircleAvatar(backgroundImage: NetworkImage(profileImageUrl)),

            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(nickname, style: MyTextStyle.small),
                    const SizedBox(width: 5),
                    Text("|", style: MyTextStyle.small),
                    const SizedBox(width: 5),
                    Text(date, style: MyTextStyle.small),
                  ],
                ),
                Text(title, style: MyTextStyle.subtitle),
              ],
            ),
          ],
        ),
        const Divider(),
        Text(content, overflow: TextOverflow.ellipsis, maxLines: 3),
      ],
    );
  }
}
