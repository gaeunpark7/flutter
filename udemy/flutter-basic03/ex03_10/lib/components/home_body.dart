import 'package:ex03_10/common/my_size.dart';
import 'package:ex03_10/common/my_style.dart';
import 'package:ex03_10/vo/cust_review.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<CustReview> lstReviews = [];

  @override
  void initState() {
    //초기화.
    super.initState();

    _getReviewDate();
  }

  _getReviewDate() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    //서버에 데이터 요청
    lstReviews.add(CustReview(
        destImg: "hotel.jpeg",
        custImg: "gom1.jpeg",
        custName: "농농곰맘",
        reviewTitle: "사장님친절하고 괜찮았어요.",
        reviewContent:
            "제시간에 출발하지 않는다고 해서 걱정 많이 했는데 제 시간 출발했고 돌아올 때도 연락은 없었습니다. 덕분에 편안한 여행 했어요.",
        ratting: 4.97));

    lstReviews.add(CustReview(
        destImg: "hotel2.jpeg",
        custImg: "gom2.png",
        custName: "담곰맘",
        reviewTitle: "방이 깨끗해요",
        reviewContent:
            "아이들이랑 덕분에 좋은 여행했네요 ^^. 딸냄과 아들냄이 너무 좋아해요~~ 다음에 또 방문하고 싶네요. 너무 아쉬워서 또 가고 싶어요!! 다음에 또 이용해야겠어요~~",
        ratting: 4.0));

    lstReviews.add(CustReview(
        destImg: "hotel3.jpeg",
        custImg: "gom3.jpeg",
        custName: "곰곰곰맘",
        reviewTitle: "자연이랑 함께할 수 있어서 좋았어요.",
        reviewContent:
            "제시간에 출발하지 않는다고 해서 걱정 많이 했는데 제 시간 출발했고 돌아올 때도 연락은 없었습니다. 덕분에 편안한 여행 했어요.",
        ratting: 3.5));

    lstReviews.add(CustReview(
        destImg: "hotel4.jpeg",
        custImg: "gom4.jpeg",
        custName: "홍곰동동",
        reviewTitle: "별로에요.",
        reviewContent: "사진이랑 같긴한데, 음식 제공이 너무 짜요. 음식 좀 더 줬으면 좋겠어요.",
        ratting: 2.0));

    lstReviews.add(CustReview(
        destImg: "hotel5.jpeg",
        custImg: "gom5.jpeg",
        custName: "박곰곰곰",
        reviewTitle: "사장님친절하고 괜찮았어요.",
        reviewContent:
            "제시간에 출발하지 않는다고 해서 걱정 많이 했는데 제 시간 출발했고 돌아올 때도 연락은 없었습니다. 덕분에 편안한 여행 했어요.",
        ratting: 3.0));

    lstReviews.add(CustReview(
        destImg: "hotel6.jpeg",
        custImg: "gom6.jpeg",
        custName: "김곰곰",
        reviewTitle: "사장님친절하고 괜찮았어요.",
        reviewContent:
            "제시간에 출발하지 않는다고 해서 걱정 많이 했는데 제 시간 출발했고 돌아올 때도 연락은 없었습니다. 덕분에 편안한 여행 했어요.",
        ratting: 4.97));
    //화면 다시 그리기
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var imgwidth = (MediaQuery.of(context).size.width * 0.8) / 3 - 10;
    return Center(
      child: lstReviews.isEmpty
          ? const CircularProgressIndicator()
          : Wrap(
              children:
                  lstReviews.map((e) => _buildReviewItem(e, imgwidth)).toList(),
            ),
    );
  }

  Widget _buildReviewItem(CustReview e, double width) {
    return InkWell(
      onTap: () {
        print("102: ${e.custName}");
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          constraints: const BoxConstraints(minWidth: 250, maxWidth: 300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildItemImage(e, width),
              _buildItemTitle(e, width),
              _buildItemContent(e, width),
              const SizedBox(height: 10),
              _buildItemUserAndRating(e, width),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  _buildItemImage(CustReview e, double width) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: AspectRatio(
          aspectRatio: 3 / 2, //사진 비율 고정
          child: Image.asset("assets/images/${e.destImg}", fit: BoxFit.cover),
        ));
  }

  _buildItemTitle(CustReview e, double width) {
    return Text(e.reviewTitle, style: MyStyle.subtitle());
  }

  _buildItemContent(CustReview e, double width) {
    return Text(
      e.reviewContent,
      maxLines: 3, //최대 줄
      overflow: TextOverflow.ellipsis, //...
    );
  }

  _buildItemUserAndRating(CustReview e, double width) {
    return Row(
      children: [
        CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("assets/images/${e.custImg}")),
        const SizedBox(width: 5),
        Text(
            "${e.custName.substring(0, 1)}*${e.custName.substring(e.custName.length - 1)}",
            style: MyStyle.subtitle()),
        const Spacer(),
        const Icon(Icons.star),
        Text(e.ratting.toStringAsFixed(2)), //소수 이하 2자리
        const SizedBox(width: 5),
      ],
    );
  }
}
