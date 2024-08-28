import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/features/chat/model/chat-model.dart';

class ChatInboxScreen extends StatelessWidget {
  final Chat chat;

  const ChatInboxScreen({required this.chat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/back.png'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          chat.userName,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.asset('assets/Setting.png'),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                decoration: BoxDecoration(
                    color: Color(0xFF364960),
                    borderRadius: BorderRadius.circular(20.r)),
                child: Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.w),
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(chat.userImage),
                        radius: 20.r,
                      ),
                      SizedBox(width: 8.w),
                      ChatMessageBox(
                        messageType: MessageType.text,
                        messageContent: "Hey, how's it going?",
                        time: "12:00 PM",
                        isSentByUser: false,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChatMessageBox(
                        messageType: MessageType.text,
                        messageContent: "All good! How about you?",
                        time: "12:01 PM",
                        isSentByUser: true,
                      ),
                      SizedBox(width: 8.w),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/Photo.png'),
                        radius: 20.r,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(chat.userImage),
                        radius: 20.r,
                      ),
                      SizedBox(width: 8.w),
                      ChatMessageBox(
                        messageType: MessageType.image,
                        messageContent: "assets/Frame.png",
                        time: "12:05 PM",
                        isSentByUser: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              children: [
                IconButton(
                  icon: Image.asset('assets/gallery.png'),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 16.w,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Image.asset('assets/send.png'),
                  onPressed: () {
                    // Handle send action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
          Text(
            time,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
