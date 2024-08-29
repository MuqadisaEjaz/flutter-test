import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum MessageType { text, image }

class ChatMessageBox extends StatelessWidget {
  final MessageType messageType;
  final String messageContent;
  final String time;
  final bool isSentByUser;

  const ChatMessageBox({
    required this.messageType,
    required this.messageContent,
    required this.time,
    required this.isSentByUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFECF3F6),
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsets.all(12.w),
      constraints: BoxConstraints(maxWidth: 250.w),
      child: Column(
        crossAxisAlignment:
            isSentByUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (messageType == MessageType.text)
            Text(
              messageContent,
              style: TextStyle(fontSize: 14.sp),
            ),
          if (messageType == MessageType.image)
            Image.asset(
              messageContent,
              width: 200.w,
              height: 150.h,
              fit: BoxFit.cover,
            ),
          SizedBox(height: 4.h),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              time,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
