class PostModel {
  final String userName;
  final String profilePic;
  final int likesCount;
  final int commentsCount;
  final String postDesc;
  final String uploadedOn;
  final String? postUrl;

  PostModel({

    required this.userName,
    required this.profilePic,
    required this.likesCount,
    required this.commentsCount,
    required this.postDesc,
    required this.uploadedOn,
    this.postUrl,
  });
}
