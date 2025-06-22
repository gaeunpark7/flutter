import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final postListProvider = StateNotifierProvider<
  PostListNotifier,
  AsyncValue<List<Map<String, dynamic>>>
>((ref) => PostListNotifier());

class PostListNotifier
    extends StateNotifier<AsyncValue<List<Map<String, dynamic>>>> {
  PostListNotifier() : super(const AsyncValue.loading()) {
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      final supabase = Supabase.instance.client;
      final response = await supabase
          .from('posts')
          .select(
            'id, title, content, create_at, user_id, users(nickname, profile_image)',
          )
          .order('create_at', ascending: false);
      state = AsyncValue.data(List<Map<String, dynamic>>.from(response));
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addPost(String title, String content, String userId) async {
    final supabase = Supabase.instance.client;
    await supabase.from('posts').insert({
      'title': title,
      'content': content,
      'user_id': userId,
    });
    await fetchPosts();
  }

  Future<void> updatePost(String id, String title, String content) async {
    final supabase = Supabase.instance.client;
    await supabase
        .from('posts')
        .update({
          'title': title,
          'content': content,
          'updated_at': DateTime.now().toUtc().toIso8601String(),
        })
        .eq('id', id);
    await fetchPosts();
  }

  Future<void> deletePost(String id) async {
    final supabase = Supabase.instance.client;
    await supabase.from('posts').delete().eq('id', id);
    await fetchPosts();
  }
}
