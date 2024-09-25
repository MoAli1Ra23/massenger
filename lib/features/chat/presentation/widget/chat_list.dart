// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:massenger/core/utils/my_assets.dart';
import 'package:massenger/features/chat/domain/entity/chat.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    super.key,
    required this.chats,
  });
  final List<Chat> chats;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          var c = chats[index];
          return Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              children: [
                CircleAvatar(
                  child: (c.profiles?.first != null &&
                          c.profiles!.first.imagepathe != null)
                      ? CachedNetworkImage(
                          imageUrl: c.profiles!.first.imagepathe!)
                      : Image.asset(MyAssets.prof),
                ),
                const SizedBox(
                  width: 25,
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Text(
                          (c.profiles!.first.name ?? c.profiles?.first.email) ??
                              "_"),
                      Text(
                        c.lastMessge ??
                            "hamadahamadahamadahamadaham adahamad ahamadahama dahamadahamadah amadahamadahama dahamadahamada alo",
                        maxLines: 20,
                        
                        overflow: TextOverflow.fade,
                        softWrap: true,
                        
                         
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
