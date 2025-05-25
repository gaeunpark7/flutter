import 'package:flutter/material.dart';
import 'package:flutter_labs/features/board/edit_post_page.dart';
import 'package:flutter_labs/shared/constants/my_text_style.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';

class CommunityBoradDetail extends StatefulWidget {
  final Map<String, dynamic> post;

  const CommunityBoradDetail({super.key, required this.post});

  @override
  State<CommunityBoradDetail> createState() => _CommunityBoradDetailState();
}

class _CommunityBoradDetailState extends State<CommunityBoradDetail> {
  String formatDate(String timestampe) {
    final date = DateTime.parse(timestampe);
    return DateFormat('MM.dd').format(date);
  }

  //게시물 삭제
  Future<void> _deletePost() async {
    final supabase = Supabase.instance.client;

    try {
      await supabase
          .from('posts')
          .delete()
          .eq('id', widget.post['id']); // 해당 게시물 id 기준으로 삭제

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("게시물이 삭제되었습니다.")));
      Navigator.pop(context); // 삭제 후 이전 화면으로 돌아감
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("에러: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;
    final isMyPost =
        post['user_id'] == Supabase.instance.client.auth.currentUser?.id;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          actions: <Widget>[
            if (isMyPost)
              PopupMenuButton(
                onSelected: (value) {
                  if (value == 'edit') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditPostPage(post: post),
                      ),
                    );
                  } else if (value == 'delete') {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text("게시물 삭제"),
                          content: Text("게시물을 정말 삭제하시겠습니까?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("취소"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _deletePost();
                              },
                              child: Text("삭제"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                itemBuilder: (context) {
                  return <PopupMenuEntry>[
                    PopupMenuItem(value: 'edit', child: Text('수정')),
                    PopupMenuItem(value: 'delete', child: Text('삭제')),
                  ];
                },
              ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post['title'] ?? '제목없음',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                myinfo(
                  post['users']?['nickname'] ?? '알수없음',
                  formatDate(post['create_at']),
                  post['users']?['profile_image'],
                ),
                const SizedBox(height: 10),
                Divider(thickness: 0.7, color: Colors.grey),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width,

                  constraints: const BoxConstraints(
                    minHeight: 200, // 최소 높이 설정
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        post['content'] ?? '내용없음',
                        style: TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                Divider(thickness: 0.7, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }

  myinfo(String nickname, String date, String? profileImageUrl) {
    return Row(
      children: [
        profileImageUrl == null || profileImageUrl.isEmpty
            ? const CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: Icon(Icons.person, color: Colors.white),
            )
            : CircleAvatar(backgroundImage: NetworkImage(profileImageUrl)),
        const SizedBox(width: 5),
        Text(nickname, style: TextStyle(fontSize: 15)),
        const SizedBox(width: 5),
        Text("|", style: TextStyle(fontSize: 15)),
        const SizedBox(width: 5),
        Text(date, style: TextStyle(fontSize: 15, color: Colors.grey)),
      ],
    );
  }
}

mixin supabase {}
