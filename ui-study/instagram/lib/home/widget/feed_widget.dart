import 'package:flutter/material.dart';
import 'package:instagram/home/model/profile_model.dart';

class FeedWidget extends StatefulWidget {
  final Post post;
  const FeedWidget({super.key, required this.post});

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: (widget.post.profileImage.isNotEmpty)
                    ? AssetImage(widget.post.profileImage)
                    : null,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.post.nickname ?? ''),
                  Text(widget.post.location ?? ''),
                ],
              ),
              Spacer(),
              Icon(Icons.more_horiz),
            ],
          ),
          //사진
          SizedBox(
            height: 270,
            width: double.infinity,
            child: Stack(
              children: [
                PageView.builder(
                  itemCount: widget.post.postImages.length,
                  onPageChanged: (value) {
                    setState(() {
                      _currentPage = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    final image = widget.post.postImages[index];

                    return (image.isNotEmpty)
                        ? Image.asset(image, fit: BoxFit.cover)
                        : Container();
                  },
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),

                    child: Row(
                      children: List.generate(
                        3,
                        (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //아이콘
          Row(
            children: [
              Icon(Icons.favorite, size: 35),
              const SizedBox(width: 10),
              Icon(Icons.chat_bubble_outline, size: 35),
              const SizedBox(width: 10),

              // Icon(Icons.send_outlined, size: 35),
              Spacer(),
              Icon(Icons.bookmark, size: 40),
            ],
          ),
          //설명
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text("님 여러명이 좋아합니다."),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      widget.post.nickname,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 5),
                    Text(widget.post.descript),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
