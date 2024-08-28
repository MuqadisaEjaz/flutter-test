import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/features/feed/model/post.dart';

enum FeedType { public, business }

final feedTypeProvider = StateProvider<FeedType>((ref) => FeedType.public);

final feedProvider = Provider.family<List<Post>, FeedType>((ref, feedType) {
  return feedType == FeedType.public
      ? [
          Post(
            id: 1,
            imageUrl: 'assets/Photo.png',
            name: 'John Doe',
            topicName: 'Flutter Development',
            isVerified: true,
            timeAgo: '1 hour ago',
            content: 'Flutter is an awesome framework for building apps!',
            postImageUrl: 'assets/Photo.png',
          ),
          Post(
            id: 1,
            imageUrl: 'assets/Photo.png',
            name: 'John Doe',
            topicName: 'Flutter Development',
            isVerified: true,
            timeAgo: '1 hour ago',
            content: 'Flutter is an awesome framework for building apps!',
            postImageUrl: 'assets/Photo.png',
          ),
        ]
      : [
          Post(
            id: 2,
            imageUrl: 'assets/Photo.png',
            name: 'John Doe',
            topicName: 'Flutter Development',
            isVerified: true,
            timeAgo: '1 hour ago',
            content: 'Flutter is an awesome framework for building apps!',
            postImageUrl: 'assets/Photo.png',
          ),
        ];
});
