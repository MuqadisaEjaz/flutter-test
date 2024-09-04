import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/features/chat/presenatation/screens/chat-inbox.dart';
import 'package:test/features/chat/presenatation/screens/chat.dart';

import 'package:test/features/create-post/presentation/screens/create-post.dart';
import 'package:test/features/feed/presentation/screens/feed.dart';
import 'package:test/routes/navbar_navigation.dart';

class AppRoutes {
  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return NavigationShell(
            navigationShell: navigationShell,
            currentLocation: state.location,
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                pageBuilder: (context, state) => MaterialPage(
                  child: FeedScreen(),
                ),
              ),
              GoRoute(
                path: '/chat',
                pageBuilder: (context, state) => MaterialPage(
                  child: ChatScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/message/:userName',
        pageBuilder: (context, state) {
          final userName = state.pathParameters['userName']!;
          return MaterialPage(
            child: ChatInboxScreen(
              userName: userName,
            ),
          );
        },
      ),
      GoRoute(
        path: '/create-post',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: CreatePostScreen(),
          );
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('No route defined for ${state.location}'),
      ),
    ),
  );
}
