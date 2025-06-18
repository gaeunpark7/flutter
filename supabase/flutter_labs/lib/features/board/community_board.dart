import 'package:flutter/material.dart';
import 'package:flutter_labs/features/board/community_borad_detail.dart';
import 'package:flutter_labs/features/board/data/post_provider.dart';
import 'package:flutter_labs/shared/constants/my_text_style.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunityBoard extends ConsumerWidget {
  const CommunityBoard({super.key});

  String formatDate(String timestampe) {
    final date = DateTime.parse(timestampe);
    return DateFormat('MM.dd').format(date);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(postListProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: postsAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text("데이터를 불러오는 중 오류가 발생했습니다.")),
          data: (posts) {
            if (posts.isEmpty) {
              return const Center(child: Text("게시물이 없습니다."));
            }
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  pinned: false,
                  title: const Text(
                    "게시판",
                    style: TextStyle(color: Colors.white),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.blueGrey,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((
                    BuildContext context,
                    int index,
                  ) {
                    final post = posts[index];
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
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
                              profileImageUrl: post['users']?['profile_image'],
                            ),
                          ),
                        ),
                      ),
                    );
                  }, childCount: posts.length),
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
