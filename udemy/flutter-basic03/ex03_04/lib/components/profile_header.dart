import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          _buildUserImage("assets/images/브이곰.png"),
          const SizedBox(width: 30),
          _buildUserInfo("Damgom"),
        ],
      ),
    );
  }

  _buildUserInfo(String text) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(
            "배우, 연예인, 2008년부터 영화 출연",
            style: TextStyle(fontSize: 15),
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              const Icon(Icons.link, color: Color.fromARGB(255, 5, 42, 71)),
              const SizedBox(width: 5),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, // 기본 패딩 제거
                  minimumSize: Size.zero, // 최소 크기 제거
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // 터치 영역 최소화
                ),
                child: const Text(
                  "jokebear.com",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 5, 42, 71)),
                ),
                onPressed: () {
                  print("36: 링크 클릭");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildUserImage(String imageName) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 0.2),
          image:
              DecorationImage(image: AssetImage(imageName), fit: BoxFit.cover)),
    );

    // return const CircleAvatar(
    //   radius: 70,
    //   backgroundImage: AssetImage("assets/images/브이곰.png"),
    // );
  }
}
