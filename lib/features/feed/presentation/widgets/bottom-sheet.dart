import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopicBottomSheet extends StatefulWidget {
  @override
  _TopicBottomSheetState createState() => _TopicBottomSheetState();
}

class _TopicBottomSheetState extends State<TopicBottomSheet> {
  String? _selectedTopic;

  final List<String> _topics = [
    'Topic 1',
    'Topic 2',
    'Topic 3',
    'Topic 4',
    'Topic 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _topics.length,
              itemBuilder: (context, index) {
                final topic = _topics[index];
                final isSelected = topic == _selectedTopic;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTopic = topic;
                    });
                    // Navigator.pop(context); // Close the bottom sheet
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.green : Colors.transparent,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          isSelected ? 'assets/topic.png' : 'assets/topic2.png',
                          width: 40.w,
                          height: 40.h,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          topic,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
