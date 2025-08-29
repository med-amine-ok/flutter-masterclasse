import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      theme: ThemeData.dark(),
      home: InstagramPost(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InstagramPost extends StatefulWidget {
  @override
  _InstagramPostState createState() => _InstagramPostState();
}

class _InstagramPostState extends State<InstagramPost> {
  // This list holds all the comments (like a box where we keep all messages)
  List<Comment> comments = [
    Comment(username: "amine_123", text: "Amazing photo! 😍", time: "2h"),
    Comment(username: "mike_photo", text: "Great work on this!", time: "1h"),
    Comment(username: "emma_art", text: "Love the colors!", time: "45m"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      body: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(Icons.arrow_back, color: Colors.white, size: 24),
                SizedBox(width: 16),
                Text(
                  'Explore',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // User Info
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 245, 245),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.flutter_dash,
                    color: const Color.fromARGB(255, 15, 86, 218),
                    size: 20,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'flutter Task',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Suggested for you',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 15, 81, 224),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Follow',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.more_vert, color: Colors.white, size: 20),
              ],
            ),
          ),

          // Main Content
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    'assets/images/Screenshot_20250827_020557_Instagram.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade800,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: Colors.grey.shade400,
                              size: 48,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Failed to load image',
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Check your internet connection',
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),

          // Dot indicators
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(7, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  width: index == 0 ? 8 : 6,
                  height: index == 0 ? 8 : 6,
                  decoration: BoxDecoration(
                    color:
                        index == 0
                            ? Colors.blue.shade400
                            : Colors.grey.shade600,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),

          // Interaction Bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite_border, color: Colors.white, size: 26),
                    SizedBox(width: 8),
                    Text(
                      '1,405',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(width: 24),
                // This is the magic button! When you tap it, comments appear!
                GestureDetector(
                  onTap: () {
                    // This opens the comments section (like opening a drawer)
                    _showCommentsSheet(context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        '${comments.length}', // Shows how many comments we have
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 24),
                Row(
                  children: [
                    Icon(Icons.share_outlined, color: Colors.white, size: 24),
                    SizedBox(width: 8),
                    Text(
                      '14',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(width: 24),
                Row(
                  children: [
                    Icon(Icons.send_outlined, color: Colors.white, size: 24),
                    SizedBox(width: 8),
                    Text(
                      '486',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.bookmark_border, color: Colors.white, size: 26),
              ],
            ),
          ),

          // Post description
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Flutter Task',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: ' Beautiful Flutter Task... ',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  TextSpan(
                    text: 'more',
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            alignment: Alignment.centerLeft,
            child: Text(
              '18 August',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
            ),
          ),

          // Bottom Navigation
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(color: Color(0xFF1C1C1E)),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.home, color: Colors.white, size: 28),
                  Icon(Icons.search, color: Colors.white, size: 28),
                  Icon(Icons.add_box_outlined, color: Colors.white, size: 28),
                  Icon(
                    Icons.video_library_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.grey.shade600,
                    backgroundImage: NetworkImage(
                      'https://via.placeholder.com/28',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // This function shows the comments section 
  void _showCommentsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true, 
      useSafeArea: true, 
      builder:
          (context) => Padding(
            padding: EdgeInsets.only(
              bottom:
                  MediaQuery.of(context)
                      .viewInsets
                      .bottom, 
            ),
            child: CommentsSheet(
              comments: comments,
              onAddComment: (String commentText) {
                setState(() {
                  comments.add(
                    Comment(
                      username:
                          "you", 
                      text: commentText,
                      time: "now",
                    ),
                  );
                });
              },
            ),
          ),
    );
  }
}

// This is like a blueprint for what a comment looks like
class Comment {
  final String username;
  final String text;
  final String time;

  Comment({required this.username, required this.text, required this.time});
}

// This is the comments section that slides up from the bottom
class CommentsSheet extends StatefulWidget {
  final List<Comment> comments;
  final Function(String) onAddComment;

  CommentsSheet({required this.comments, required this.onAddComment});

  @override
  _CommentsSheetState createState() => _CommentsSheetState();
}

class _CommentsSheetState extends State<CommentsSheet> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          MediaQuery.of(context).size.height * 0.75, // Takes up 3/4 of screen
      decoration: BoxDecoration(
        color: Color(0xFF1C1C1E),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Handle bar at the top (like a handle to drag)
          Container(
            margin: EdgeInsets.only(top: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade600,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Comments header
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Comments',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close, color: Colors.white),
                ),
              ],
            ),
          ),

          Divider(color: Colors.grey.shade700, height: 1),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: widget.comments.length,
              itemBuilder: (context, index) {
                final comment = widget.comments[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.grey.shade600,
                        child: Text(
                          comment.username[0].toUpperCase(),
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      SizedBox(width: 12),
                      // Comment content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: comment.username,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ${comment.text}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              comment.time,
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Heart icon for liking comments
                      Icon(
                        Icons.favorite_border,
                        color: Colors.grey.shade500,
                        size: 16,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Divider(color: Colors.grey.shade700, height: 1),

          Container(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Row(
              children: [
                // Your profile picture
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.blue,
                  child: Text(
                    'Y',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey.shade600),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey.shade600),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    maxLines: null,
                  ),
                ),
                SizedBox(width: 8),
                // Post button
                GestureDetector(
                  onTap: () {
                    if (_commentController.text.trim().isNotEmpty) {
                      widget.onAddComment(_commentController.text.trim());
                      _commentController.clear(); // Clear the text field
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Post',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
