import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/features/chat/presenatation/widget/chat-card.dart';
import 'package:test/features/chat/provider/chat-provider.dart';

import 'package:test/shared/widgets/navbar.dart';

class ChatScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chats = ref.watch(chatProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Message',
            style: TextStyle(color: Colors.black, fontSize: 18.sp),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Image.asset(
                'assets/add.png',
                width: 24.w,
                height: 24.h,
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            return ChatCard(chat: chats[index]);
          },
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: 3,
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
}
