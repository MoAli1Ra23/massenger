// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:massenger/features/chat/domain/entity/message.dart';
import 'package:massenger/features/profile/domain/entity/profile.dart';

class Chat extends Equatable {
  final String? id;
  final List<Profile>? profiles;
  final List<Message> messages;
  final String? lastMessge;
  const Chat({
    required this.id,
    required this.profiles,
    required this.messages,
    this.lastMessge,
  });

  Chat copyWith({
    String? id,
    List<Profile>? profiles,
    List<Message>? messages,
    String? lastMessge,
  }) {
    return Chat(
      id: id ?? this.id,
      profiles: profiles ?? this.profiles,
      messages: messages ?? this.messages,
      lastMessge: lastMessge ?? this.lastMessge,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'profiles': profiles?.map((x) => x.toMap()).toList(),
      'messages': messages.map((x) => x.toMap()).toList(),
      'lastMessge': lastMessge,
    };
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      id: map['id'] != null ? map['id'] as String : null,
      profiles: map['profiles'] != null ? List<Profile>.from((map['profiles'] as List<int>).map<Profile?>((x) => Profile.fromMap(x as Map<String,dynamic>),),) : null,
      messages: List<Message>.from((map['messages'] as List<int>).map<Message>((x) => Message.fromMap(x as Map<String,dynamic>),),),
      lastMessge: map['lastMessge'] != null ? map['lastMessge'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Chat.fromJson(String source) =>
      Chat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, profiles, messages, lastMessge];
}
