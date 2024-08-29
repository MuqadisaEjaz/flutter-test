import 'package:test/features/feed/model/post.dart';

class DummyData {
  static List<Post> getPublicFeed() {
    return [
      Post(
        id: 1,
        imageUrl: 'assets/Photo.png',
        name: 'James',
        topicName: 'Topic name',
        isVerified: true,
        timeAgo: '1 hour ago',
        content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae',
        // postImageUrl: 'assets/Photo.png',
      ),
      Post(
        id: 2,
        imageUrl: 'assets/Photo.png',
        name: 'James',
        topicName: 'Topic name',
        isVerified: true,
        timeAgo: '1 hour ago',
        content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae',
        postImageUrl: 'assets/Photo.png',
      ),
    ];
  }

  static List<Post> getBusinessFeed() {
    return [
      Post(
        id: 3,
        imageUrl: 'assets/Photo.png',
        name: 'James',
        topicName: 'Topic name',
        isVerified: true,
        timeAgo: '1 hour ago',
        content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae',
        postImageUrl: 'assets/Photo.png',
      ),
    ];
  }
}
