class _ChatMessage {
  final String nickname;
  final String text;
  final bool isMe;
  final String? profileUrl;
  final DateTime time;

  _ChatMessage(
      {required this.nickname,
      required this.text,
      required this.profileUrl,
      required this.isMe,
      required this.time});
}
