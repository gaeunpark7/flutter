import 'package:flutter/material.dart';

class SliverPage extends StatefulWidget {
  const SliverPage({super.key});

  @override
  State<SliverPage> createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage> {
  var lstProd = List.generate(50, (index) {
    //50개의 카드가 생김
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: GestureDetector(
        onTap: () {
          print("16: 상품번호 $index 클릭!!");
        },
        child: SizedBox(
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("상품코드 : #$index"),
                    Text("상품명 : #$index"),
                    Text("재고수량 : #${index + 10}"),
                  ],
                ),
              ),
            )),
      ),
    );
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.blue,
              pinned: true, //접어질 때 남기는 높이
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  "농담공장 재고 현황",
                ),
                background: Image.asset("assets/선글곰.jpg", fit: BoxFit.cover),
              ),
              expandedHeight: 150, //확장높이
            ),
            // const SliverFillRemaining(
            //   child: Center(
            //     child: Text("컨텐츠 영어"),
            //   ),
            // )
            SliverList(
              delegate: SliverChildListDelegate(lstProd),
            ),
          ],
        ),
        // appBar: AppBar(
        //     title: const Text("Sliver Page"), backgroundColor: Colors.blue[200]),
      ),
    );
  }
}
