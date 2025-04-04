import 'package:flutter/material.dart';

class ProfileCount extends StatefulWidget {
  const ProfileCount({super.key});

  @override
  State<ProfileCount> createState() => _ProfileCountState();
}

class _ProfileCountState extends State<ProfileCount> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildCountInfo("게시물", "121"),
          Container(width: 1.5, height: 25, color: Colors.grey),
          buildCountInfo("팔로워", "1147만"),
          Container(width: 1.5, height: 25, color: Colors.grey),
          buildCountInfo("팔로우", "400"),
        ],
      ),
    );
  }

  buildCountInfo(String title, String text) {
    return Column(
      children: [
        Text(title,
            style: const TextStyle(fontSize: 16, color: Colors.black54)),
        Text(text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
