import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/features/feed/model/data.dart';
import 'package:test/features/feed/model/post.dart';

enum FeedType { public, business }

final feedTypeProvider = StateProvider<FeedType>((ref) => FeedType.public);

final feedProvider = Provider.family<List<Post>, FeedType>((ref, feedType) {
  return feedType == FeedType.public
      ? DummyData.getPublicFeed()
      : DummyData.getBusinessFeed();
});
