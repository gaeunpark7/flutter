import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<_chatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("채팅"),
        // centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, //리스트 역순으로 표시
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final messages = _messages[_messages.length - 1 - index];
                return _ChatBubble(messages: messages);
              },
            ),
          ),
          _chatInputField(),
        ],
      ),
    );
  }

  _chatInputField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "메시지를 입력하세요.",
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              if (_controller.text.trim().isNotEmpty) {
                setState(() {
                  _messages.add(
                    _chatMessage(
                      text: _controller.text.trim(),
                      time: DateTime.now(),
                    ),
                  );
                  _controller.clear();
                });
              }
            },
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  const _ChatBubble({super.key, required this.messages});

  final _chatMessage messages;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: Text(messages.text),
          ),
          const SizedBox(height: 1),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              _formatTime(messages.time),
              style: TextStyle(color: Colors.grey, fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}

class _chatMessage {
  final String text;
  final DateTime time;
  _chatMessage({required this.text, required this.time});
}

String _formatTime(DateTime time) {
  return "${time.hour.toString().padLeft(2, "0")}:${time.minute.toString().padLeft(2, "0")}";
}
