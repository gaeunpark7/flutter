import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> items = [
    {
      "itemImage": "이미지1",
      "itemName": "item1",
      "itemPrice": "1000",
      "itemDesc": "item1의 설명입니다.",
    },
    {
      "itemImage": "이미지2",
      "itemName": "item2",
      "itemPrice": "1000",
      "itemDesc": "item2의 설명입니다.",
    },
    {
      "itemImage": "이미지3",
      "itemName": "item3",
      "itemPrice": "1000",
      "itemDesc": "item3의 설명입니다.",
    },
    {
      "itemImage": "이미지4",
      "itemName": "item4",
      "itemPrice": "1000",
      "itemDesc": "item4의 설명입니다.",
    },
    {
      "itemImage": "이미지5",
      "itemName": "item5",
      "itemPrice": "1000",
      "itemDesc": "item5의 설명입니다.",
    },
    {
      "itemImage": "이미지6",
      "itemName": "item6",
      "itemPrice": "1000",
      "itemDesc": "item6의 설명입니다.",
    },
    {
      "itemImage": "이미지5",
      "itemName": "item5",
      "itemPrice": "1000",
      "itemDesc": "item5의 설명입니다.",
    },
    {
      "itemImage": "이미지6",
      "itemName": "item6",
      "itemPrice": "1000",
      "itemDesc": "item6의 설명입니다.",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Icon(Icons.workspace_premium_outlined),
              ),
              const SizedBox(width: 10),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.35,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 15),
                    Text("₩", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTitleButton(backColor: Colors.blueGrey, title: "상점"),
                    SizedBox(width: 10),
                    _buildTitleButton(
                      backColor: const Color.fromARGB(255, 197, 222, 234),
                      title: "테마",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),

              Expanded(
                flex: 6,
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10, // 아이템 간의 가로 간격
                        mainAxisSpacing: 10, // 아이템 간의 세로 간격
                        childAspectRatio: 0.7, // 아이템의 가로/세로 비율 설정
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 120,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Center(
                                child: Text(
                                  "이미지 ${index + 1}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              items[index]["itemName"],
                              style: TextStyle(fontSize: 14),
                            ),
                            // const SizedBox(height: 12),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Expanded(
                flex: 3,
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),

              Expanded(
                flex: 1,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueGrey,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 1,
                      MediaQuery.of(context).size.height * 0.1,
                    ),
                  ),
                  onPressed: () {},
                  child: Text("구매", style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _buildTitleButton extends StatelessWidget {
  final Color backColor;
  final String title;
  const _buildTitleButton({
    super.key,
    required this.backColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(5),
        ),
        height: 50,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
