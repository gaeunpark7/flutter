import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_notifier.g.dart';

class Message {
  final String chatId;
  final String id;
  final String senderId;
  final String content;
  final DateTime createAt;
  final bool isRead;

  Message({
    required this.id,
    required this.senderId,
    required this.content,
    required this.createAt,
    this.isRead = false,
    required this.chatId,
  });

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'],
      senderId: map['sender_id'],
      content: map['content'],
      createAt: DateTime.parse(map['created_at']),
      isRead: map['is_read'] ?? false,
      chatId: map['chat_id'],
    );
  }

  Message copyWith({
    String? id,
    String? senderId,
    String? content,
    DateTime? createAt,
    bool? isRead,
    String? chatId,
  }) {
    return Message(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      content: content ?? this.content,
      createAt: createAt ?? this.createAt,
      isRead: isRead ?? this.isRead,
      chatId: chatId ?? this.chatId,
    );
  }
}

@riverpod
class ChatNotifier extends _$ChatNotifier {
  late final SupabaseClient _supabase;

  @override
  Stream<List<Message>> build() {
    final supabase = Supabase.instance.client;

    //rls 권한 설정 > select 권한이 있는 메시지만 전달.
    return supabase
        .from("messages")
        .stream(primaryKey: ['id'])
        .order('created_at', ascending: true)
        .map(
          (List<Map<String, dynamic>> data) =>
              data.map((e) => Message.fromMap(e)).toList(),
        );
  }

  //insert 권한이 있는지 검사
  Future<void> sendMessage(
    String chatId,
    String senderId,
    String content,
  ) async {
    try {
      await _supabase.from('messages').insert({
        'chat_id': chatId,
        'sender_id': senderId,
        'content': content,
        'is_read': false,
      });
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  Future<void> markMessageAsRead(String messageId) async {
    try {
      //update 권한이 있는지 확인인
      await _supabase
          .from('message')
          .update({'is_read': true})
          .eq('id', messageId);
    } catch (e) {
      print('Error marking message as read: $e');
    }
  }
}
