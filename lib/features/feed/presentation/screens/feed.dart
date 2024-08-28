import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:test/features/feed/presentation/widgets/custom-post.dart';
import 'package:test/features/feed/provider/feed-provider.dart';
import 'package:test/shared/widgets/navbar.dart';

class FeedScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedType = ref.watch(feedTypeProvider);
    final posts = ref.watch(feedProvider(feedType));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Image.asset(
                'assets/li_bell.png',
                width: 24.w,
                height: 24.h,
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildFeedTab("Public Feed", feedType == FeedType.public, () {
                    ref.read(feedTypeProvider.notifier).state = FeedType.public;
                  }),
                  SizedBox(width: 32.w),
                  _buildFeedTab("Business Feed", feedType == FeedType.business,
                      () {
                    ref.read(feedTypeProvider.notifier).state =
                        FeedType.business;
                  }),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return PostCard(post: posts[index]);
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: 0,
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.pushNamed(context, '/home');
                break;
              case 1:
                Navigator.pushNamed(context, '/search');
                break;
              case 2:
                Navigator.pushNamed(context, '/create');
                break;
              case 3:
                Navigator.pushNamed(context, '/chat');
                break;
              case 4:
                Navigator.pushNamed(context, '/profile');
                break;
            }
          },
        ),
      ),
    );
  }

  Widget _buildFeedTab(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16.sp,
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isSelected)
            Container(
              margin: EdgeInsets.only(top: 4.h),
              height: 2.h,
              width: text.length * 8.w,
              color: Colors.green,
            ),
        ],
      ),
    );
  }
}
