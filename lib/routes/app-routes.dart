import 'package:flutter/material.dart';
import 'package:test/features/chat/presenatation/screens/chat.dart';
import 'package:test/features/create-post/presentation/screens/create-post.dart';
import 'package:test/features/feed/presentation/screens/feed.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => FeedScreen());
      case '/chat':
        return MaterialPageRoute(builder: (_) => ChatScreen());
      case '/create-post':
        return MaterialPageRoute(builder: (_) => CreatePostScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
