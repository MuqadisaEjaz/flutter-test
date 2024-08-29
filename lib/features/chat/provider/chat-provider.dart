// chat_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/features/chat/model/chat-model.dart';
import 'package:test/features/chat/model/data.dart';

final chatProvider = Provider<List<Chat>>((ref) {
  return DummyChatData.getChats();
});
