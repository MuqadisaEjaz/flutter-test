import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  BottomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/home-2.png', width: 24.w, height: 24.h),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/search-normal.png',
              width: 24.w, height: 24.h),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/add-square.png', width: 24.w, height: 24.h),
          label: 'Create',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/messages-2.png', width: 24.w, height: 24.h),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/profile.png', width: 24.w, height: 24.h),
          label: 'Profile',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle:
          TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontSize: 12.sp),
    );
  }
}
