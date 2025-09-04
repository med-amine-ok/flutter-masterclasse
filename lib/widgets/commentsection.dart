import 'package:flutter/material.dart';

import 'package:flutter_task/model/post.dart';

class CommentSection extends StatelessWidget {
  final PostModel post; // The post to display comments for
  const CommentSection({
    super.key,
    required this.post, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 500,
              width: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                ),
              ),
            );
          },
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.comment_outlined, size: 22),
          const SizedBox(width: 6),
          post.commentsCount == 0
              ? const Text('Comment')
              : Text('${post.commentsCount}'),
        ],
      ),
    );
  }
}
