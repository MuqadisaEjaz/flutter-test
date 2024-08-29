import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/features/create-post/model/create-post-model.dart';

final postProvider = StateProvider<CreatePost>((ref) {
  return CreatePost(type: 'Public', content: '', topics: []);
});

final selectedTypeProvider = StateProvider<String>((ref) {
  return 'Public';
});

final selectedTopicProvider = StateProvider<String>((ref) {
  return '';
});
