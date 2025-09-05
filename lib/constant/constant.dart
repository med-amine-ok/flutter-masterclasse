import 'package:flutter_task/model/post.dart';
import 'package:flutter_task/model/comment.dart';

final List<PostModel> posts = [
  PostModel(
    userName: 'medamie',
    profilePic: 'assets/images/default.jpg',
    likesCount: 230,
    commentsCount: 1,
    comments: [
      Comment(
        username: 'medamie',
        profilePic: 'assets/images/default.jpg',
        text: "Great post!",
        time: "2h ago",
        isLiked: false,
        likesCount: 5,
      ),
    ],
    postUrl: 'assets/images/default.jpg',
    postDesc: 'A visit to the natures park!!',
    uploadedOn: '12 minutes',
  ),
  PostModel(
    userName: 'john',
    profilePic: 'assets/images/instagram.jpg',
    likesCount: 30,
    commentsCount: 3,
    comments: [
      Comment(
        username: 'john',
        profilePic: 'assets/images/instagram.jpg',
        text: "Nice view!",
        time: "1h ago",
        isLiked: false,
        likesCount: 12,
      ),
      Comment(
        username: 'john',
        profilePic: "assets/images/default.jpg",
        text: "Nice!",
        time: "1h ago",
        isLiked: false,
        likesCount: 3,
      ),
      Comment(
        username: 'mooh',
        profilePic: "assets/images/default.jpg",
        text: "Nice!",
        time: "1h ago",
        isLiked: false,
        likesCount: 7,
      ),
    ],
    postUrl: 'assets/images/instagram.webp',
    postDesc: 'Awesomeness!',
    uploadedOn: '27 minutes',
  ),
  PostModel(
    userName: 'mooh',
    profilePic: 'assets/images/p3.jpg',
    likesCount: 230,
    commentsCount: 1,
    comments: [
      Comment(
        username: 'mooh',
        profilePic: 'assets/images/p3.jpg',
        text: "Lovely!",
        time: "3h ago",
        isLiked: false,
        likesCount: 2,
      ),
    ],
    postUrl: 'assets/images/instagram.webp',
    postDesc: 'No Comments!!',
    uploadedOn: '45 minutes',
  ),
  PostModel(
    userName: 'mrbeast',
    profilePic: 'assets/images/p4.jpg',
    likesCount: 23000,
    commentsCount: 0,
    comments: [],
    postUrl: 'assets/images/post5.jpg',
    postDesc: '#TeamSeas',
    uploadedOn: '2 minutes',
  ),
];