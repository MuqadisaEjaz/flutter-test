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
              child: Stack(
                children: [
                  // Green underliner
                  Positioned(
                    bottom: 0,
                    left: feedType == FeedType.public
                        ? 0
                        : MediaQuery.of(context).size.width / 2,
                    child: Container(
                      height: 2.h,
                      width: MediaQuery.of(context).size.width / 2,
                      color: Colors.green,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: _buildFeedTab(
                            "Public Feed", feedType == FeedType.public, () {
                          ref.read(feedTypeProvider.notifier).state =
                              FeedType.public;
                        }),
                      ),
                      Expanded(
                        child: _buildFeedTab(
                            "Business Feed", feedType == FeedType.business, () {
                          ref.read(feedTypeProvider.notifier).state =
                              FeedType.business;
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Feeds',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito',
                    ),
                  ),
                  IconButton(
                    icon: Image.asset('assets/filter.png'),
                    onPressed: () {},
                  ),
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
                Navigator.pushNamed(context, '/');
                break;
              case 1:
                // Navigator.pushNamed(context, '/search');
                break;
              case 2:
                Navigator.pushNamed(context, '/create-post');
                break;
              case 3:
                Navigator.pushNamed(context, '/chat');
                break;
              case 4:
                //  Navigator.pushNamed(context, '/profile');
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
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 10.h),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            color: isSelected ? Colors.black : Colors.grey,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito',
          ),
        ),
      ),
    );
  }
}
