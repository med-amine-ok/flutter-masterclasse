class Comment {
  final String profilePic;
  final String username;
  final String text;
  final String time;
  bool isLiked;
  int likesCount;

  Comment({
    required this.profilePic,
    required this.username,
    required this.text,
    required this.time,
    this.isLiked = false,
    this.likesCount = 0,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      profilePic: "https://images.unsplash.com/photo-1534528741775-53994a6e05ee?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
      username: _extractUsername(json['email'] ?? 'anonymous@example.com'),
      text: json['body'] ?? 'No comment text',
      time: _getRandomTime(),
      isLiked: false,
      likesCount: _getRandomLikes(),
    );
  }

  
  static String _extractUsername(String email) {
    try {
      return email.split('@')[0].replaceAll('.', '_');
    } catch (e) {
      return 'user${DateTime.now().millisecondsSinceEpoch % 1000}';
    }
  }

  
  static String _getRandomTime() {
    final random = DateTime.now().millisecondsSinceEpoch % 24;
    if (random < 1) return 'now';
    if (random < 60) return '${random}m';
    return '${random}h';
  }

  // Helper method to generate random likes
  static int _getRandomLikes() {
    return DateTime.now().millisecondsSinceEpoch % 50;
  }

  // Method to toggle like status
  void toggleLike() {
    isLiked = !isLiked;
    if (isLiked) {
      likesCount++;
    } else {
      likesCount--;
    }
  }
}