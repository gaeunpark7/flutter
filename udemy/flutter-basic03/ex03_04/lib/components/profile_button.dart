import 'package:flutter/material.dart';

class ProfileButton extends StatefulWidget {
  const ProfileButton({super.key});

  @override
  State<ProfileButton> createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Spacer(),
        _buildButton("팔로잉", width, _onFollow),
        const Spacer(),
        _buildButton("메시지 보내기", width, _onMessage),
        const Spacer(),
      ],
    );
  }

  _buildButton(String text, double width, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: width * 0.6 / 2,
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
    );
  }

  void _onFollow() {
    print("팔로잉 버튼 클릭");
  }

  void _onMessage() {
    print("메시지 버튼 클릭");
  }
}
