class Profile {
  String nickname;
  String profileImage;
  Profile({required this.nickname, required this.profileImage});
}

class Post {
  String profileImage;
  String nickname;
  String location;
  List<String> postImages;
  String descript;

  Post({
    required this.profileImage,
    required this.nickname,
    required this.location,
    required this.postImages,
    required this.descript,
  });
}
