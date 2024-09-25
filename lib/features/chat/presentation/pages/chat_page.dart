import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:massenger/features/chat/presentation/provider/chat_provider.dart';
import 'package:massenger/features/profile/presentation/page/profile_page.dart';

import '../widget/chat_list.dart';
import 'messages_page.dart';

var provider = StateNotifierProvider<ChatProvider, ChatsState>((ref) {
  return ChatProvider();
});

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Chats"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const ProfilePage()));
              },
              icon: const Icon(CupertinoIcons.person_fill))
        ],
        leading: const SizedBox(
          width: 0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const MessagesPage()));
        },
        child: const Icon(Icons.message_rounded),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          var f = ref.watch(provider);
          return ChatList(
            chats: f.chats,
          );
        },
      ),
    );
  }
}
