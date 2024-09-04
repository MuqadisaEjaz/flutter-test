import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test/features/create-post/provider/create-post-provider.dart';

class CreatePostScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedType = ref.watch(selectedTypeProvider);
    final selectedTopic = ref.watch(selectedTopicProvider);
    final post = ref.watch(postProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset('assets/back.png'),
            onPressed: () => context.pop(),
          ),
          title: Text('Create Post'),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text('Create Post'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            SizedBox(width: 16.w),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              child: Row(
                children: [
                  Expanded(
                    child: _buildTabs(
                      'Public',
                      selectedType == 'Public',
                      () {
                        ref.read(selectedTypeProvider.notifier).state =
                            'Public';
                        post.setType('Public');
                        ref.read(postProvider.notifier).state = post;
                      },
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: _buildTabs(
                      'Business',
                      selectedType == 'Business',
                      () {
                        ref.read(selectedTypeProvider.notifier).state =
                            'Business';
                        post.setType('Business');
                        ref.read(postProvider.notifier).state = post;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Type something...',
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  post.setContent(value);
                  ref.read(postProvider.notifier).state = post;
                },
              ),
            ),
            SizedBox(height: 16.h),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Topic',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.w), // Adjust margin here
              child: SizedBox(
                height: 60.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildTopicBox('Climate Change and Sustainability',
                        selectedTopic == 'Climate Change', () {
                      ref.read(selectedTopicProvider.notifier).state =
                          'Climate Change';
                      post.addTopic('Climate Change');
                      ref.read(postProvider.notifier).state = post;
                    }),
                    SizedBox(width: 8.w),
                    _buildTopicBox(
                        'Conscious Art', selectedTopic == 'Conscious Art', () {
                      ref.read(selectedTopicProvider.notifier).state =
                          'Conscious Art';
                      post.addTopic('Conscious Art');
                      ref.read(postProvider.notifier).state = post;
                    }),
                    SizedBox(width: 8.w),
                    _buildTopicBox('Flutter', selectedTopic == 'Flutter', () {
                      ref.read(selectedTopicProvider.notifier).state =
                          'Flutter';
                      post.addTopic('Flutter');
                      ref.read(postProvider.notifier).state = post;
                    }),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  IconButton(
                    icon: Image.asset(
                      'assets/camera.png',
                      width: 25.w,
                      height: 25.h,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(width: 16.w),
                  IconButton(
                    icon: Image.asset(
                      'assets/gallery.png',
                      width: 25.w,
                      height: 25.h,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  Widget _buildTabs(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.grey[200],
          borderRadius: BorderRadius.circular(30.r), // More rounded
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopicBox(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.grey[200],
          borderRadius: BorderRadius.circular(30.r), // More rounded
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
