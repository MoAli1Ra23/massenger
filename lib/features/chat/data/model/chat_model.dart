import 'dart:convert';
import 'package:massenger/features/chat/data/model/message_model.dart';
import 'package:massenger/features/chat/domain/entity/chat.dart';
import 'package:massenger/features/chat/domain/entity/message.dart';
import 'package:massenger/features/profile/domain/entity/profile.dart';
class ChatModel extends Chat {
  final List<String> userids;
  const ChatModel(this.userids,
      {super.id, super.profiles, required super.messages, super.lastMessge});

  @override
  ChatModel copyWith(
      {
      String? id,
      List<Profile>? profiles,
      List<Message>? messages,
      String? lastMessge,
      List<String>? userids}) {
    return ChatModel(
      userids ?? this.userids,
      id: id ?? this.id,
      profiles: profiles ?? this.profiles,
      messages: messages ?? this.messages,
      lastMessge: lastMessge ?? this.lastMessge,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'profiles': profiles?.map((x) => x.toMap()).toList(),
      'messages': messages.map((x) => x.toMap()).toList(),
      'lastMessge': lastMessge,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      const [],
      messages: List<MessageModel>.from(
        (map['messages'] as List<int>).map<MessageModel>(
          (x) => MessageModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      lastMessge:
          map['lastMessge'] != null ? map['lastMessge'] as String : null,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        id,
        profiles,
        messages,
        lastMessge,
        userids,
      ];
}
