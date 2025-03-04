class Post {
  final String id;
  final String userId;
  final String userName;
  final String userImage;
  final String content;
  final String? image;
  final DateTime createdAt;
  final int likes;
  final int replies;
  final bool isLiked;

  Post({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.content,
    this.image,
    required this.createdAt,
    required this.likes,
    required this.replies,
    this.isLiked = false,
  });
} 