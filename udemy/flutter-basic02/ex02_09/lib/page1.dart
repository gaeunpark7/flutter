import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
var boardList = List.generate(10, (index) {
  return Card(
    child: Text("게시물 ${index + 1}"),
  );
}).toList();

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            line01(),
            line02(),
            line03(),
            // line04(),
          ],
        ),
      ),
    );
  }
}

line01() {
  return Column(
    children: [
      const Padding(padding: EdgeInsets.all(8)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              print("34: 고객정보 클릭");
            },
            child: const Column(
              children: [Icon(Icons.person_rounded), Text("고객정보01")],
            ),
          ),
          const Column(
            children: [Icon(Icons.ac_unit), Text("고객정보02")],
          ),
          const Column(
            children: [
              Icon(Icons.account_balance_wallet_rounded),
              Text("고객정보03")
            ],
          ),
          const Column(
            children: [Icon(Icons.baby_changing_station), Text("고객정보01")],
          ),
        ],
      ),
      const Padding(
          padding: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 20)),
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [Icon(Icons.person_rounded), Text("고객정보01")],
          ),
          Column(
            children: [Icon(Icons.ac_unit), Text("고객정보02")],
          ),
          Opacity(
            //투명도, 아이콘을 숨김
            opacity: 0,
            child: Column(children: [
              Icon(Icons.account_balance_wallet_rounded),
              Text("고객정보03")
            ]),
          ),
          Opacity(
            opacity: 0,
            child: Column(
              children: [Icon(Icons.baby_changing_station), Text("고객정보01")],
            ),
          ),
        ],
      ),
    ],
  );
}

line02() {
  return Container(
      color: Colors.grey[200],
      width: double.infinity,
      height: 200,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 2.0,
        ),
        items: imgList
            .map((item) => Container(
                  // color: Colors.green,
                  child: Center(
                      child: GestureDetector(
                          onTap: () {
                            print("118:$item");
                          },
                          child: Image.network(item.toString(),
                              fit: BoxFit.cover))),
                ))
            .toList(),
      ));
}

line03() {
  return ListView(
    shrinkWrap: true,
    physics:
        const NeverScrollableScrollPhysics(), //singleS랑 같이 쓰면 문제발생 > shrink적용
    children: boardList, //ListView만 스크롤됨 > NeverScroll적용
  );
}

// line04() 
//   return Container(child: const Text("Line04"));
// }
