import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test/features/chat/model/chat-model.dart';
import 'package:test/features/chat/presenatation/screens/message-box.dart';

class ChatInboxScreen extends StatelessWidget {
  final String userName;

  const ChatInboxScreen({required this.userName});

  @override
  Widget build(BuildContext context) {
    final Chat chat = Chat(
        userName: userName,
        userImage: 'assets/Avatar.png',
        lastMessage: 'Hello, I really like your post about...',
        timeAgo: '2 mins ago',
        numberOfMessage: '5');

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/back.png'),
          onPressed: () => context.go('/chat'),
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
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.w),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Center(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(chat.userImage),
                        radius: 20.r,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: ChatMessageBox(
                          messageType: MessageType.text,
                          messageContent:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer euismod, nunc eget aliquet dignissim, neque sapien tincidunt eros, sit amet dapibus nulla enim ac nisi",
                          time: "12:00 PM",
                          isSentByUser: false,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: ChatMessageBox(
                          messageType: MessageType.text,
                          messageContent:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer euismod, nunc eget aliquet dignissim, neque sapien tincidunt eros, sit amet dapibus nulla enim ac nisi",
                          time: "12:01 PM",
                          isSentByUser: true,
                        ),
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(chat.userImage),
                        radius: 20.r,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: ChatMessageBox(
                          messageType: MessageType.image,
                          messageContent: "assets/Frame.png",
                          time: "12:05 PM",
                          isSentByUser: false,
                        ),
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
                      border: InputBorder.none,
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
