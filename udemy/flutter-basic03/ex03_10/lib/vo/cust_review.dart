class CustReview {
  // final int id;
  final String destImg; //장소사진

  final String custImg; //고객사진
  final String custName;

  final String reviewTitle;
  final String reviewContent;
  final double ratting;

  CustReview(
      {
      // required this.id,
      required this.destImg,
      required this.custImg,
      required this.custName,
      required this.reviewTitle,
      required this.reviewContent,
      required this.ratting});
}
