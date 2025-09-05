import 'package:flutter/material.dart';
import 'package:instagram/home/model/profile_model.dart';

class StorySectionWidget extends StatelessWidget {
  final List<Profile> profiles;
  const StorySectionWidget({super.key, required this.profiles});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: profiles.length,
            itemBuilder: (context, index) {
              final nickname = profiles[index].nickname ?? '';
              final image = profiles[index].profileImage ?? '';
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: (image.isNotEmpty)
                          ? AssetImage(image)
                          : null,

                      backgroundColor: nickname == "내 스토리"
                          ? Colors.grey[200]
                          : Colors.amber,
                      child: nickname == "내 스토리"
                          ? Icon(
                              Icons.person,
                              size: 70,
                              color: Colors.grey[600],
                            )
                          : null,
                    ),
                    const SizedBox(height: 5),
                    Text(nickname ?? ''),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
