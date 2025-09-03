import 'package:flutter_task/model/post.dart';

final List<PostModel> posts = [
  PostModel(
    userName: 'medamie',
    profilePic: 'assets/images/default.jpg',
    likes: 230,
    comments: 40,
    postUrl: 'assets/images/default.jpg',
    postDesc: 'A visit to the natures park!!',
    uploadedOn: '12 minutes',
  ),
  PostModel(
    userName: 'john',
    profilePic: 'assets/images/instagram.jpg',
    likes: 30,
    comments: 10,
    postUrl: 'assets/images/instagram.webp',
    postDesc: 'Awesomeness!',
    uploadedOn: '27 minutes',
  ),
  PostModel(
    userName: 'mooh',
    profilePic: 'assets/images/p3.jpg',
    likes: 230,
    comments: 40,
    postUrl: 'assets/images/instagram.webp',
    postDesc: 'No Comments!!',
    uploadedOn: '45 minutes',
  ),
  PostModel(
    userName: 'mrbeast',
    profilePic: 'assets/images/p4.jpg',
    likes: 23000,
    comments: 400,
    postUrl: 'assets/images/post5.jpg',
    postDesc: '#TeamSeas',
    uploadedOn: '2 minutes',
  ),
];
