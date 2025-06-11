import 'package:flutter/material.dart';
import 'package:flutter_labs/group/data/chat_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String currentUsserId =
        Supabase.instance.client.auth.currentUser?.id ?? "알수없음";
    final String currerntChatId = "83cac7b8-479e-42ae-ac89-e5046cb9f894";
    final AsyncValue<List<Message>> chatMessagesAsync = ref.watch(
      chatNotifierProvider,
    );
    final ChatNotifier chatController = ref.read(chatNotifierProvider.notifier);
    final TextEditingController controller = TextEditingController();

    // final List<_ChatMessage> _messages = [
    //   _ChatMessage(
    //     text: "안녕하세요!",
    //     time: DateTime.now().subtract(const Duration(minutes: 2)),
    //     isMe: false,
    //     nickname: "농담곰",
    //     profileUrl: null,
    //   ),
    //   _ChatMessage(
    //     text: "안녕하세요! 반가워요.",
    //     time: DateTime.now().subtract(const Duration(minutes: 1)),
    //     isMe: true,
    //   ),
    // ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("채팅", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Expanded(
            child: chatMessagesAsync.when(
              data: (message) {
                final filteredMessages =
                    message
                        .where((msg) => msg.chatId == currerntChatId)
                        .toList();
                return ListView.builder(
                  reverse: true,
                  itemCount: filteredMessages.length,
                  itemBuilder: (context, index) {
                    final message =
                        filteredMessages[filteredMessages.length - 1 - index];
                    final bool isMe = message.senderId == currentUsserId;
                    if (isMe) {
                      return _MyChatBubble(message: message, isMe: true);
                    } else {
                      return _OtherChatBubble(
                        message: message,
                        isMe: false,
                        nickname: message.senderId,
                        profileUrl: null,
                      );
                    }
                  },
                );
              },
              error: (error, stack) => Center(child: Text("Error: $error")),
              loading: () => Center(child: CircularProgressIndicator()),
            ),
          ),
          _ChatInputField(
            controller: controller,
            onSend: (text) {
              if (text.trim().isNotEmpty) {
                chatController.sendMessage(
                  text.trim(),
                  currentUsserId,
                  currerntChatId,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

// 내 채팅 버블 (오른쪽)
class _MyChatBubble extends StatelessWidget {
  final Message message;
  final bool isMe;
  const _MyChatBubble({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, bottom: 2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min, //최소한의 가로 간격만 차지
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Text(
                message.content,
                style: const TextStyle(color: Colors.black87),
              ),
            ),
            const SizedBox(height: 1),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Text(
                _formatTime(message.createAt),
                style: const TextStyle(color: Colors.blueAccent, fontSize: 11),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 상대방 채팅 버블 (왼쪽, 프로필/닉네임/채팅)
class _OtherChatBubble extends StatelessWidget {
  final Message message;
  final bool isMe;
  final String? nickname;
  final String? profileUrl;
  const _OtherChatBubble({
    required this.message,
    required this.isMe,
    this.nickname,
    this.profileUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, bottom: 2.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 프로필 이미지
            CircleAvatar(
              backgroundColor: Colors.blueGrey,
              radius: 18,
              backgroundImage:
                  profileUrl != null ? NetworkImage(profileUrl!) : null,
              child:
                  profileUrl == null
                      ? const Icon(Icons.person, size: 20, color: Colors.white)
                      : null,
            ),
            const SizedBox(width: 8),
            // 닉네임 + 채팅
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nickname ?? "상대방",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[100],
                  ),
                  child: Text(
                    message.content,
                    style: const TextStyle(color: Colors.black87),
                  ),
                ),
                const SizedBox(height: 2),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    _formatTime(message.createAt),
                    style: const TextStyle(color: Colors.grey, fontSize: 11),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 채팅 입력창 위젯
class _ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onSend;

  const _ChatInputField({required this.controller, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "메시지를 입력하세요.",
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  onSend(value.trim());
                  controller.clear();
                }
              },
            ),
          ),
          IconButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                onSend(controller.text.trim());
                controller.clear();
              }
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}

// 메시지 모델
// class _ChatMessage {
//   final String text;
//   final DateTime time;
//   final bool isMe;
//   final String? nickname;
//   final String? profileUrl;

//   _ChatMessage({
//     required this.text,
//     required this.time,
//     this.isMe = false,
//     this.nickname,
//     this.profileUrl,
//   });
// }

String _formatTime(DateTime time) {
  return "${time.hour.toString().padLeft(2, "0")}:${time.minute.toString().padLeft(2, "0")}";
}
