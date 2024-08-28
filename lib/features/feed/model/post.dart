class Post {
  final int id;
  final String imageUrl;
  final String name;
  final String topicName;
  final bool isVerified;
  final String timeAgo;
  final String content;
  final String postImageUrl;

  Post({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.topicName,
    required this.isVerified,
    required this.timeAgo,
    required this.content,
    required this.postImageUrl,
  });
}
