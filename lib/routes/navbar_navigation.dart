import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/shared/widgets/navbar.dart';

class NavigationShell extends StatelessWidget {
  final Widget navigationShell;
  final String currentLocation;

  NavigationShell({
    required this.navigationShell,
    required this.currentLocation,
  });

  @override
  Widget build(BuildContext context) {
    int _getCurrentIndex(String location) {
      switch (location) {
        case '/':
          return 0;
        case '/chat':
          return 3;
        case '/create-post':
          return 2;
        default:
          return 0;
      }
    }

    void _onNavBarTap(int index) {
      switch (index) {
        case 0:
          context.go('/');
          break;
        case 1:
          break;
        case 2:
          context.go('/create-post');
          break;
        case 3:
          context.go('/chat');
          break;
        case 4:
          break;
      }
    }

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavBar(
        currentIndex: _getCurrentIndex(currentLocation),
        onTap: (index) {
          _onNavBarTap(index);
        },
      ),
    );
  }
}
