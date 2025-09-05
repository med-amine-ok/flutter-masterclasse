import 'comment.dart';

class PostModel {
  final String userName;
  final String profilePic;
  final int likesCount;
  final int commentsCount;
  final List<Comment> comments;
  final String postDesc;
  final String uploadedOn;
  final String? postUrl;

  PostModel({
    required this.userName,
    required this.profilePic,
    required this.likesCount,
    required this.commentsCount,
    required this.comments,
    required this.postDesc,
    required this.uploadedOn,
    this.postUrl,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        userName: json['userId'].toString(),
        profilePic:
            "https://images.unsplash.com/photo-1534528741775-53994a6e05ee?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
        likesCount: 0,
        commentsCount: 0,
        comments: [],
        postDesc: json['title'],
        uploadedOn: json['body'],
        postUrl: null,
      );
}
