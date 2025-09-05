import 'package:flutter/material.dart';
import 'package:flutter_task/model/comment.dart';
import 'package:flutter_task/model/post.dart';
import 'package:flutter_task/widgets/commentsection.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InstagramCard extends StatelessWidget {
  final PostModel post;

  const InstagramCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/default.jpg',
                      ),
                      radius: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      post.userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const Icon(Icons.more_vert_outlined),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Handle image with proper error handling
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Image.asset(
              post.postUrl ??
                  'assets/images/Screenshot_20250827_020557_Instagram.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/Screenshot_20250827_020557_Instagram.jpg',
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Icon(Icons.favorite_border_outlined, size: 25),
                    const SizedBox(width: 6),
                    post.likesCount == 0
                        ? const Text('Likes')
                        : Text('${post.likesCount}'),
                    const SizedBox(width: 15),
                    // Fixed: Remove FutureBuilder and just show CommentSection
                    GestureDetector(
                      onTap: () {
                        // You can add navigation to comments screen here
                        _showCommentsBottomSheet(context);
                      },
                      child: const Icon(Icons.chat_bubble_outline, size: 22),
                    ),
                    const SizedBox(width: 15),
                    const Icon(Icons.send_outlined, size: 22),
                  ],
                ),
                const Icon(Icons.bookmark_border_outlined, size: 25),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: Wrap(
              children: [
                Text(
                  post.userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  post.postDesc,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 7),
            child: GestureDetector(
              onTap: () => _showCommentsBottomSheet(context),
              child: Text(
                'View all ${post.commentsCount} Comments',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: Text(
              '${post.uploadedOn} ago',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCommentsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<Comment>>(
                  future: fetchComments(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.error_outline, size: 48, color: Colors.red),
                            const SizedBox(height: 16),
                            Text('Error: ${snapshot.error}'),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.chat_bubble_outline, size: 48, color: Colors.grey),
                            SizedBox(height: 16),
                            Text('No comments available'),
                          ],
                        ),
                      );
                    } else {
                      return CommentSection(post: post, comments: snapshot.data!);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Fixed fetchComments function - now fetches actual comments
Future<List<Comment>> fetchComments() async {
  try {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'))
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      // Take only first 10 comments to avoid too much data
      final limitedData = data.take(10).toList();
      return limitedData.map((comment) => Comment.fromJson(comment)).toList();
    } else {
      throw Exception('Failed to load comments: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching comments: $e');
  }
}