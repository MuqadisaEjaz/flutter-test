import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/features/feed/model/post.dart';
import 'package:test/features/feed/presentation/widgets/bottom-sheet.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          post.imageUrl,
                          width: 40.w,
                          height: 40.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(post.name, style: TextStyle(fontSize: 16.sp)),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.white,
                                context: context,
                                isScrollControlled: true,
                                isDismissible: false,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.25, // Set height to a quarter of screen size
                                    child: TopicBottomSheet(),
                                  );
                                },
                              );
                            },
                            child: Text(
                              post.topicName,
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      if (post.isVerified)
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Image.asset('assets/verify.png',
                              width: 16.w, height: 16.h),
                        ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(post.timeAgo,
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.grey)),
                      SizedBox(width: 10.w),
                      Image.asset('assets/more.png', width: 20.w, height: 20.h),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                post.content,
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              Image.asset(post.postImageUrl),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/like.png', width: 24.w, height: 24.h),
                      SizedBox(width: 10.w),
                      Image.asset('assets/comment.png',
                          width: 24.w, height: 24.h),
                      SizedBox(width: 10.w),
                      Image.asset('assets/share.png',
                          width: 24.w, height: 24.h),
                    ],
                  ),
                  Image.asset('assets/save.png', width: 24.w, height: 24.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
