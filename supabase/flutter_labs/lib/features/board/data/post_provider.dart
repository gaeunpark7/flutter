import 'package:flutter_riverpod/flutter_riverpod.dart';

final postListProvider =
    StateNotifierProvider<PostListNotifier, List<Map<String, dynamic>>>(
      (ref) => PostListNotifier(),
    );

class PostListNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  PostListNotifier() : super([]);

  void setPosts(List<Map<String, dynamic>> posts) {}

  void addPost(Map<String, dynamic> newPost) {}

  void updatePost(Map<String, dynamic> updatedPost) {
    state = [
      for (final post in state)
        if (post['id'] == updatedPost['id']) updatedPost else post,
    ];
  }

  void deletePost(String postId) {
    state = state.where((post) => post['id'] != postId).toList();
  }
}
