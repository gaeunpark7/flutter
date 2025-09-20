import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  const PageViewPage({super.key});

  @override
  State<PageViewPage> createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<String> _image = [
    "https://picsum.photos/id/1015/400/300",
    "https://picsum.photos/id/1025/400/300",
    "https://picsum.photos/id/1035/400/300",
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PageView")),
      body: Column(
        children: [
          SizedBox(
            height: 350,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _controller,
                  onPageChanged: ((index) => setState(() {
                    _currentPage = index;
                  })),
                  itemCount: _image.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      _image[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  },
                ),
                Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_image.length, (index) {
                      return Container(
                        width: 8,
                        height: 8,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? Colors.white
                              : Colors.white54,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
