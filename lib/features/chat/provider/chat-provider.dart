import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/features/chat/model/chat-model.dart';

final chatProvider = Provider<List<Chat>>((ref) {
  return [
    Chat(
        userName: 'Bruno Pham',
        userImage: 'assets/Photo.png',
        lastMessage: 'Hello, I really like your post about...',
        timeAgo: '2 mins ago',
        numberOfMessage: '5'),
    Chat(
        userName: 'Bruno Pham',
        userImage: 'assets/Photo.png',
        lastMessage: 'Hello, I really like your post about...',
        timeAgo: '2 mins ago',
        numberOfMessage: '5'),
    Chat(
        userName: 'Bruno Pham',
        userImage: 'assets/Photo.png',
        lastMessage: 'Hello, I really like your post about...',
        timeAgo: '2 mins ago',
        numberOfMessage: '5'),
    Chat(
        userName: 'Bruno Pham',
        userImage: 'assets/Photo.png',
        lastMessage: 'Hello, I really like your post about...',
        timeAgo: '2 mins ago',
        numberOfMessage: '5'),
    Chat(
        userName: 'Bruno Pham',
        userImage: 'assets/Photo.png',
        lastMessage: 'Hello, I really like your post about...',
        timeAgo: '2 mins ago',
        numberOfMessage: '5'),
    Chat(
        userName: 'Bruno Pham',
        userImage: 'assets/Photo.png',
        lastMessage: 'Hello, I really like your post about...',
        timeAgo: '2 mins ago',
        numberOfMessage: '5'),
    Chat(
        userName: 'Bruno Pham',
        userImage: 'assets/Photo.png',
        lastMessage: 'Hello, I really like your post about...',
        timeAgo: '2 mins ago',
        numberOfMessage: '5'),
    Chat(
        userName: 'Bruno Pham',
        userImage: 'assets/Photo.png',
        lastMessage: 'Hello, I really like your post about...',
        timeAgo: '2 mins ago',
        numberOfMessage: '5'),
    Chat(
        userName: 'Bruno Pham',
        userImage: 'assets/Photo.png',
        lastMessage: 'Hello, I really like your post about...',
        timeAgo: '2 mins ago',
        numberOfMessage: '5'),
    Chat(
        userName: 'Bruno Pham',
        userImage: 'assets/Photo.png',
        lastMessage: 'Hello, I really like your post about...',
        timeAgo: '2 mins ago',
        numberOfMessage: '5'),
    Chat(
        userName: 'Bruno Pham',
        userImage: 'assets/Photo.png',
        lastMessage: 'Hello, I really like your post about...',
        timeAgo: '2 mins ago',
        numberOfMessage: '5'),
  ];
});
